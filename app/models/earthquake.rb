# app/models/earthquake.rb
class Earthquake < ApplicationRecord
  self.table_name = 'earthquakes'  # Specify the existing table name
  has_many :comments, dependent: :destroy
  validates :magnitude, :place, :time, presence: true
  validates :magnitude, numericality: { greater_than_or_equal_to: 0 }
end