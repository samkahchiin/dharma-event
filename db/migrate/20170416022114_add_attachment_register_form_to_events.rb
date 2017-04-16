class AddAttachmentRegisterFormToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :register_form
    end
  end

  def self.down
    remove_attachment :events, :register_form
  end
end
