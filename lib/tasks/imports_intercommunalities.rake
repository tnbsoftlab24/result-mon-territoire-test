namespace :db do
  desc "imports the intercommunalities"
  task imports_intercommunalities: :environment do
    require 'csv'

    csv_file_path = File.read(Rails.root.join("spec", "fixtures", "epcicom.csv"))
    csv = CSV.parse(csv_file_path, col_sep: ';', headers: true)

    csv.each do |row|
      intercommunality = Intercommunality.find_or_create_by!(name: row['nom_complet'], siren: row['siren_epci'], form: row['form_epci'].slice(0, 3).downcase)
    end
    value = Intercommunality.count
    p value
  end
end
