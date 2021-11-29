class AddColumnstoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, default: ""
    add_column :users, :last_name, :string, default: ""
    add_column :users, :description, :text, default: ""
  end
end
