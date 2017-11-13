class Game < ApplicationRecord
  belongs_to :user
  belongs_to :catergory
  has_many   :reviews

  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
