require 'rails_helper'

RSpec.feature "Checking Product Details Page", type: :feature, js: true do
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

  scenario "They can click on a product" do
    #ACT
    visit root_path
    first('article.product').click

    #DEBUG
    save_screenshot

    # VERIFY
    page.has_css?('article.product-detail')
  end

end
