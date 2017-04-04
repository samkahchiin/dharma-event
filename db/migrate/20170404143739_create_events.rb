class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string   :title
      t.datetime :start_time
      t.datetime :end_time
      t.string   :speaker
      t.text     :description
      t.string   :contact
      t.string   :location
      t.integer  :price

      t.timestamps
    end
  end
end
