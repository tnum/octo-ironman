class Topic < ActiveRecord::Base

  has_many :posts

  include Paginate
  
end
