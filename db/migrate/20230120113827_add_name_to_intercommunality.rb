class AddNameToIntercommunality < ActiveRecord::Migration[7.0]
  def change
    add_column :intercommunalities, :name, :string
  end
end
