class Book < ApplicationRecord
  validates_presence_of :title, :category
  belongs_to :user
end
