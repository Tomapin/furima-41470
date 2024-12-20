class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string :itemname, null: false
      t.string :category, null: false
      t.integer :money , null: false
      t.string :name, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
