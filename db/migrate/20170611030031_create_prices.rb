class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.string :price_type
      t.integer :amount
      t.references :event

      t.timestamps
    end
  end
end
