class CreateParcels < ActiveRecord::Migration[7.0]
  def change
    create_table :parcels do |t|
      t.string :number
      t.integer :prefix
      t.string :section
      t.string :plan

      t.timestamps
    end
  end
end
