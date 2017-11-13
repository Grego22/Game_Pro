class Game < ApplicationRecord
  belongs_to :user
  belongs_to :catergory
  has_attached_file :game_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :game_img, content_type: /\Aimage\/.*\z/
end
