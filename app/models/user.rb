class User < ActiveRecord::Base
  
  validates_presence_of :firstname, :lastname, :address
  
end