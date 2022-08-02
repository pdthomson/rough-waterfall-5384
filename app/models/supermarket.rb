class Supermarket < ApplicationRecord
  has_many :customers
  has_many :supermarket_items, through: :customers
  has_many :items, through: :supermarket_items

  def unique_items
    items.distinct
  end

end
