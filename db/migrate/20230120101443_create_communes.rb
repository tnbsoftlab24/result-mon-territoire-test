class CreateCommunes < ActiveRecord::Migration[7.0]
  def change
    create_table :communes do |t|
      t.string :Intercommunality
      t.string :street

      t.timestamps
    end
  end
end
