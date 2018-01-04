class Storage < ApplicationRecord
  has_attached_file :pic, :path => ":rails_root/public/uploads/storage/:hash.:extension",:hash_secret => "longSecretString"
  validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
