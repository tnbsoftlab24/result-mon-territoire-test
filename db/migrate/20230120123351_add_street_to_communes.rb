class AddStreetToCommunes < ActiveRecord::Migration[7.0]
  def change
    add_reference :communes, :street, null: true, foreign_key: true
  end
end
