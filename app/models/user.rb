class User < ActiveRecord::Base
  
  validates_presence_of :firstname, :lastname, :address
  validates_uniqueness_of :firstname
  
end
