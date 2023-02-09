class AddPopulationToIntercommunalities < ActiveRecord::Migration[7.0]
  def change
    add_column :intercommunalities, :population, :integer
  end
end
