class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :detail
      t.string :price
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end