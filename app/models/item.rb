class Item < ApplicationRecord
  has_many :supermarket_items
  has_many :customers, through: :supermarket_items
end
