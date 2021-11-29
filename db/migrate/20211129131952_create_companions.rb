class CreateCompanions < ActiveRecord::Migration[6.0]
  def change
    create_table :companions do |t|
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
