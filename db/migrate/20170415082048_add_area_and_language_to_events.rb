class AddAreaAndLanguageToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :area, :string
    add_column :events, :language, :string
  end
end
