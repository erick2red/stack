class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :username, :enabled

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true,
                       :length => { :minimum => 6 },
                       :allow_nil => false,
                       :allow_blank => false

  class << self
    def authenticate_by_email(email, password)
      if user = find_by_email(email)
        if user.password == password
          user
        end
      end
    end

    def authenticate_by_username(username, password)
      if user = find_by_username(username)
        if user.password == password
          user
        end
      end
    end
  end
end
