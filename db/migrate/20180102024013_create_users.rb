class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string "name",                  null: false
      t.string "password_digest" ,      null: false
      t.string "email",                 null: false
      t.string "login",                 null: false

      t.timestamps
    end

    add_index :users, ["login"], name: "index_login_on_user", unique: true
    add_index :users, ["email"], name: "index_email_on_user", unique: true
  end
end
