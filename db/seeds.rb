require 'csv'

vaccine_csv_text = File.read(Rails.root.join('lib', 'seeds', 'Vaccines.csv'))
vaccine_csv = CSV.parse(csv_text)

Vaccine.destroy_all

vaccine_csv.each do |row|
    Vaccine.create({
        name: row[0],
        routine: row[1],
        when_to_vaccinate: row[2],
        description: row[3]
    })
end