class AddForeignKeyToPrice < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :prices, :events
  end
end
