class AddSirenToIntercommunality < ActiveRecord::Migration[7.0]
  def change
    add_column :intercommunalities, :siren, :string
  end
end
