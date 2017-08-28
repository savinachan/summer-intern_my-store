class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.boolean :is_online ,default: false
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
