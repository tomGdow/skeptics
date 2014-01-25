class AddAttachmentFotoToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :foto
    end
  end

  def self.down
    drop_attached_file :users, :foto
  end
end
