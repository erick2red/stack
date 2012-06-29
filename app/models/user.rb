class User < ActiveRecord::Base
  attr_accessible :email, :name, :username, :language
  has_secure_password

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => {
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/,
                      :message => I18n.t(:malformed_email)
                    }

  validates :password, :presence => true,
                       :length => { :minimum => 8 },
                       :allow_nil => false,
                       :allow_blank => false

  has_many :protected_actions
  has_and_belongs_to_many :groups

  class << self
    def authenticate(name, password)
      if /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/.match(name)
        user = User.find_by_email(name)
      else
        user = User.find_by_username(name)
      end
      if user and user.authenticate(password)
        user
      end
    end
  end

  def is_admin
    groups.exists?(:name => 'admin')
  end
end
