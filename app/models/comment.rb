class Comment < ApplicationRecord
  self.table_name = 'comments'
  belongs_to :user
  belongs_to :post
end
