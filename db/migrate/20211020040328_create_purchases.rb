class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user,   null:false,forein_key: true
      t.references :item,   null:false,forein_key: true
      t.timestamps
    end
  end
end
