class RemovePriceFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :price, :integer
  end
end
