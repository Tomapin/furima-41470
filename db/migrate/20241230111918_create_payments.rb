class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :order,         null: false, foreign_key: true 
      t.string     :postcode,      null: false, default: ""
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false, default: ""
      t.string     :block,         null: false, default: ""
      t.string     :building
      t.string     :phone_number,  null: false, default: ""
      t.timestamps
    end
  end
end
