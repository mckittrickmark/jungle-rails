require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    #validates :name, presence: true

  @category = Category.new(name: 'Spaghetti')


  subject {
    described_class.new(name: "Test Product", price: 1.99, category: @category, quantity: 12)
  }

    it "has a name" do
      expect(subject.name).to be_a(String)
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "has a price" do
      expect(subject.price).to eq(1.99)
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "has a quantity" do
      expect(subject.quantity).to eq(12)
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "has a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end
end
