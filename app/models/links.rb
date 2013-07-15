class Links < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  attr_accessible :address, :name, :title

end
