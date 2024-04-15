# app/models/comment.rb
class Comment < ApplicationRecord
  self.table_name = 'comments'  # Specify the existing table name
  belongs_to :earthquake
  validates :content, presence: true
  validates :earthquake_id, presence: true
end