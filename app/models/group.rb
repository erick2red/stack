class Group < ActiveRecord::Base
  attr_protected :name
  validates :name, :presence => true, :uniqueness => true

  has_and_belongs_to_many :users
end
