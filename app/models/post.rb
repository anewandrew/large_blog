class Post < ActiveRecord::Base
  belongs_to :user
  has_one :profile, through: :user
end
