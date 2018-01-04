class AddAttachmentPicToStorages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :storages do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :storages, :pic
  end
end
