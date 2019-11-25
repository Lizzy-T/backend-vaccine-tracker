class CreateVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.boolean :routine
      t.string :when_to_vaccinate
      t.string :description

      t.timestamps
    end
  end
end
