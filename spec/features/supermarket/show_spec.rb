require 'rails_helper'

RSpec.describe 'Supermarket show page' do

  it "shows the name of the supermarket and links to all items" do
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
    supermarket_item3 = SupermarketItem.create!(item_id: item3.id, customer_id: customer2.id)
    supermarket_item4 = SupermarketItem.create!(item_id: item4.id, customer_id: customer3.id)

    visit "/supermarkets/#{supermarket1.id}"

    within "div#supermarket" do
      expect(page).to have_content('Beannah Durkes Super Store')
      expect(page).to have_link('All Items')
      click_link('All Items')
      expect(current_path).to eq("/supermarkets/#{supermarket1.id}/items")
      expect(page).to have_content('Milk')
      expect(page).to have_content('OJ')
      expect(page).to have_content('Cheese')
      expect(page).to_not have_content('Sushi')
      expect(page).to_not have_content('Fasey Cazios Moon Market')
    end

    visit "/supermarkets/#{supermarket2.id}"

    within "div#supermarket" do
      expect(page).to have_content('Fasey Cazios Moon Market')
      expect(page).to have_link('All Items')
      click_link('All Items')
      expect(current_path).to eq("/supermarkets/#{supermarket2.id}/items")
      expect(page).to have_content('Sushi')
      expect(page).to_not have_content('Milk')
      expect(page).to_not have_content('OJ')
      expect(page).to_not have_content('Cheese')
      expect(page).to_not have_content('Beannah Durkes Super Store')
    end
  end
end
