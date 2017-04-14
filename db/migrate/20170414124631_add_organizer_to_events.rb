class AddOrganizerToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :organizer_name, :string
  end
end
