class Item < ApplicationRecord
  belongs_to :user

  validates :name, length: { minimum: 3, maximum: 1000 }, presence: true
end
