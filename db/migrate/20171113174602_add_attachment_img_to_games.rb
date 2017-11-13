class AddAttachmentImgToGames < ActiveRecord::Migration[5.0]
  def self.up
    change_table :games do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :games, :img
  end
end
