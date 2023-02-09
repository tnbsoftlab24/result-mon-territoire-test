class ImportJob < ApplicationJob
  require 'csv'

  queue_as :default

 
  def perform(csv)

    input_file = File.open("spec/fixtures/epcicom.csv", "r:Windows-1252:UTF-8")
    output_file = File.open("spec/fixtures/file-generate-in-utf8-epcicom.csv", "w")
    CSV.foreach(input_file) do |row|
      row.map! { |cell| cell.gsub("C�", "Cô").gsub("�", "é") }
    
      CSV.open(output_file, "a") do |csv|
        csv << row
      end
    end
    input_file.close
    output_file.close

    csv_file_path = File.read(Rails.root.join("spec", "fixtures", "file-generate-in-utf8-epcicom.csv"))
    csv_intercommunalities = CSV.parse(csv_file_path, col_sep: ';', headers: true,  encoding: "utf-8")

    intercommunality = nil
    commune = nil
    csv_intercommunalities.each do |row|
      intercommunality = Intercommunality.find_by(siren: row['siren_epci'])
      intercommunality = Intercommunality.create(name: row['nom_complet'], siren: row['siren_epci'], form: row['form_epci'].slice(0, 3).downcase) if intercommunality.nil?
      commune = Commune.find_by(code_insee: row['insee'])
      if commune.present?
        commune.update_columns(intercommunality_id: intercommunality.id )
      else
        Commune.create(name: row['nom_com'], code_insee: row['insee'], population: row['pop_total'], intercommunality_id: intercommunality.id)
      end
      total_population = intercommunality.communes.sum(:population)
      intercommunality.update(population: total_population)
    end
  end
end
