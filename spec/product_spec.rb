require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'plants')
      @category.save
    end
    
    it "should create a product under the mentioned category" do

      product = Product.new(name: 'Genda', price_cents: 66, quantity: 4, category_id: @category.id)
      product.save
      expect(product.name).to eql('Genda')
      expect(product.price_cents).to eql(66)
      expect(product.category_id).to be_truthy

    end

    it "it should result in error when name is not mentioned" do
      product = Product.new(name: '', price_cents: 66, quantity: 4, category_id: @category.id)
      product.save
      expect(product.name?).to be_falsey
      expect(product.errors.full_messages).to include("Name can't be blank")
     
    end
    
    it "it should result in error when price is not mentioned" do
      product = Product.new(name: 'Genda', quantity: 4, category_id: @category.id)
      product.save
      expect(product.price_cents?).to be_falsey
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "it should result in error when quantity is not mentioned" do
      product = Product.new(name: 'Genda', price_cents: 66, category_id: @category.id)
      product.save
      expect(product.quantity?).to be_falsey
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "it should result in error when category is not mentioned" do
      product = Product.new(name: 'Genda', price_cents: 66, quantity: 4)
      product.save
      expect(product.category_id?).to be_falsey
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end