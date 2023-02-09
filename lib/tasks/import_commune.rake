namespace :db do
  desc "imports the communes"
  task add_communes: :environment do
    require 'csv'
    
    csv_file_path = File.read(Rails.root.join("spec", "fixtures", "epcicom.csv"))
    csv = CSV.parse(csv_file_path, col_sep: ';', headers: true)

    csv.each do |row|
      commune = Commune.find_or_create_by(name: row['nom_com'], code_insee: row['insee'], population: row['pop_total'])
    end
  end

end
