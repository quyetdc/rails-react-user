class User < ActiveRecord::Base
  paginates_per 2

  validates :name,  uniqueness: true
end
