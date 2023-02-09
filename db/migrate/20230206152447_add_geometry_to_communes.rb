class AddGeometryToCommunes < ActiveRecord::Migration[7.0]
  def change
    add_column :communes, :geometry, :json
  end
end
