class Product
  attr_accessor :id, :name, :price
  @@count = 30
  def initialize(product_params)
    @id = @@count += 1
    @name = product_params[:name]
    @price = product_params[:price]
  end
end

class Greengrocer
  attr_accessor :products
  def initialize(product_params)
    @products = []
    product_params.each do |params|
      @products << Product.new(params)
    end
  end

  def register_product(product_params)
    product_params.each do |params|
      @products << Product.new(params)
    end
  end

  def disp_products
    puts "いらっしゃいませ！商品を選んで下さい。"
    @products.each do |product, i|
      puts "#{product.id}.#{product.name}（￥#{product.price}）"
    end
  end

  def ask_quantity(chosen_product)
    puts "#{chosen_product.name}ですね。何個買いますか？"
  end
end

class User
  attr_accessor :chosen_product
  def choose_product(products)
    while true
      print "商品の番号を選択 > "
      select_product_num = gets.to_i
      @chosen_product = products.find{|product| product.id == select_product_num}
      break if !@chosen_product.nil?
      puts "#{products.first.id}から#{products.last.id}の番号から選んでください。"
    end
  end
  
  def decide_quantity
    while true
      print "個数を入力 > "
      @quantity_of_product = gets.to_i
      break if @quantity_of_product >= 1
        puts "1個以上選んでください。"
    end
  end
end

product_params1 = [
  {name: "トマト", price: 100},
  {name: "きゅうり", price: 200},
  {name: "玉ねぎ", price: 300},
  {name: "なす", price: 400}
]

greengrocer1 = Greengrocer.new(product_params1)

adding_products1 = [
  {name: "ゴボウ", price: 100},
  {name: "レンコン", price: 200}
]

greengrocer1.register_product(adding_products1)

user = User.new

greengrocer1.disp_products

user.choose_product(greengrocer1.products)

greengrocer1.ask_quantity(user.chosen_product)

user.decide_quantity