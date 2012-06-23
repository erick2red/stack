class ProtectedAction < ActiveRecord::Base
  attr_accessible

  belongs_to :user
end
