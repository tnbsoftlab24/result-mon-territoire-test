class CreateIntercommunalities < ActiveRecord::Migration[7.0]
  def change
    create_table :intercommunalities do |t|

      t.timestamps
    end
  end
end
