require "./product.rb"
require "./greengrocer.rb"
require "./user.rb"

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

greengrocer1.calculate_charges(user)