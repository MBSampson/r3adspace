class AddAttachmentPhotoToAds < ActiveRecord::Migration[5.1]
  def self.up
    change_table :ads do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :ads, :photo
  end
end
