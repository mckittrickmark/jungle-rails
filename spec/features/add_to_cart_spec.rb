require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
         image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "A product is added to the cart" do
    #ACT
    visit root_path
    first('footer.actions .btn-primary').click

    #DEBUG
    save_screenshot

    # VERIFY
    find('li.nav-cart').text == 'My Cart (1)'
  end

end
