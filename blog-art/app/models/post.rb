class Post < ApplicationRecord
  ratyrate_rateable 'technique_score', 'original_score',  'design_score'

  belongs_to :user
  has_many :comments

  has_attached_file :image,
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "/assets/default_picture.png"

  validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\Z/
end
