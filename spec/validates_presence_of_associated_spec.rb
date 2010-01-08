require 'spec_helper'

ActiveRecord::Schema.define(:version => 1) do
  create_table "products", :force => true do |t|
    t.integer "category_id"
  end
  
  create_table "categories", :force => true do |t|
  end
end

class Category < ActiveRecord::Base
end

class Product < ActiveRecord::Base
  belongs_to :category
  validates_presence_of_associated :category
end

describe Product do
  describe "validates the presence of the foreign key" do
    it "if association object is not loaded" do
      @product = Product.new
      @product.should_not be_valid
      @product.should have(1).error_on(:category_id)
    end
    
    it "if association object is not new" do
      @category = Category.create
      @product = Product.create(:category => @category)
      @product.category_id = nil
      @product.should_not be_valid
      @product.should have(1).error_on(:category_id)
    end
  end
  
  describe "does not validate presence of the foreign key" do
    it "if association object is loaded and a new record" do
      @product = Product.create(:category => Category.new)
      @product.should be_valid
    end
  end
end
