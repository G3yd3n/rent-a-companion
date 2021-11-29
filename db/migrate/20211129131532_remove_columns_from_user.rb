class RemoveColumnsFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :description
  end
end
