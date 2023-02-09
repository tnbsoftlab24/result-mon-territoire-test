class AddCodeInseeToCommune < ActiveRecord::Migration[7.0]
  def change
    add_column :communes, :code_insee, :integer
  end
end
