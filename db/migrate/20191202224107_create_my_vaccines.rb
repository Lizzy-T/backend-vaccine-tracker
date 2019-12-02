class CreateMyVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :my_vaccines do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vaccine, null: false, foreign_key: true
      t.date :given
      t.date :exp

      t.timestamps
    end
  end
end
