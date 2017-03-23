class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user

  validates_presence_of :blob, :user
end
