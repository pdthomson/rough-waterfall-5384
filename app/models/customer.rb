class Customer < ApplicationRecord
  belongs_to :supermarket
  has_many :supermarket_items
  has_many :items, through: :supermarket_items

  def total_price
    self.items.sum(:price)
  end
end
