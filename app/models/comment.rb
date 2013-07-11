class Comment < ActiveRecord::Base
  belongs_to :links
  attr_accessible :commenter, :body, :link
end
