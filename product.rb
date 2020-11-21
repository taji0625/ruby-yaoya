class Product
  attr_accessor :id, :name, :price
  @@count = 0
  def initialize(product_params)
    @id = @@count += 1
    @name = product_params[:name]
    @price = product_params[:price]
  end
end