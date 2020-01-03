class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :edition
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
