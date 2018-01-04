class CreateStorages < ActiveRecord::Migration[5.1]
  def change
    create_table :storages do |t|
      
      t.integer "order"
      t.integer "kind"
      t.string "file_name"
      t.string "content_type"
      t.integer "file_size"

      t.timestamps
    end
  end
end
