require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :customers }
    it { should have_many(:items).through(:supermarket_items)}
  end

  describe 'instance methods' do
    it "can give back a list of distinct items" do
      supermarket1 = Supermarket.create!(name:'Beannah Durkes Super Store', location:'Denver')
      supermarket2 = Supermarket.create!(name:'Fasey Cazios Moon Market', location:'Denver')

      customer1 = Customer.create!(name: 'Hai Sall', supermarket_id: supermarket1.id)
      customer2 = Customer.create!(name: 'Pach Zrince', supermarket_id: supermarket1.id)
      customer3 = Customer.create!(name: 'Gesley Warcia', supermarket_id: supermarket2.id)

      item1 = Item.create!(name: 'Milk', price:10)
      item2 = Item.create!(name: 'OJ', price:15)
      item3 = Item.create!(name: 'Cheese', price:20)
      item4 = Item.create!(name: 'Sushi', price:1)

      supermarket_item1 = SupermarketItem.create!(item_id: item1.id, customer_id: customer1.id)
      supermarket_item2 = SupermarketItem.create!(item_id: item2.id, customer_id: customer1.id)
      supermarket_item2 = SupermarketItem.create!(item_id: item2.id, customer_id: customer2.id)
      supermarket_item2 = SupermarketItem.create!(item_id: item2.id, customer_id: customer2.id)
      supermarket_item3 = SupermarketItem.create!(item_id: item3.id, customer_id: customer2.id)
      supermarket_item4 = SupermarketItem.create!(item_id: item4.id, customer_id: customer3.id)
      supermarket_item4 = SupermarketItem.create!(item_id: item4.id, customer_id: customer1.id)
      supermarket_item4 = SupermarketItem.create!(item_id: item4.id, customer_id: customer2.id)

      expect(supermarket1.unique_items.count).to eq(4)
      expect(supermarket2.unique_items.count).to eq(1)
    end
  end
end
