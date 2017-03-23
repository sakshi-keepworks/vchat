class User < ActiveRecord::Base
  has_many :posts

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if auth.info.name
        user.name = auth.info.name
      end
    end
  end
end
