class Links < ActiveRecord::Base
  has_many :comments
  attr_accessible :address, :name, :title

end
