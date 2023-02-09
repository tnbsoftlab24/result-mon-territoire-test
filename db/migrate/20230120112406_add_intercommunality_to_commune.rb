class AddIntercommunalityToCommune < ActiveRecord::Migration[7.0]
  def change
    add_reference :communes, :intercommunality, null: true, foreign_key: true
    add_column :communes, :name, :string
  end
end
