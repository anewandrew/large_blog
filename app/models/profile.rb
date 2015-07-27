class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :posts, through: :user

has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :tiny => "50x50" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
