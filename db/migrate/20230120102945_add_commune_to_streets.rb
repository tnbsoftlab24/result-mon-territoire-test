class AddCommuneToStreets < ActiveRecord::Migration[7.0]
  def change
    add_reference :streets, :commune, null: false, foreign_key: true
  end
end
