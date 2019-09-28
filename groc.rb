require 'pry'


cart1 = 
 [
      {"AVOCADO" => {:price => 3.00, :clearance => true}},
      {"KALE" => {:price => 3.00, :clearance => false}},
      {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
      {"ALMONDS" => {:price => 9.00, :clearance => false}},
      {"TEMPEH" => {:price => 3.00, :clearance => true}},
      {"CHEESE" => {:price => 6.50, :clearance => false}},
      {"BEER" => {:price => 13.00, :clearance => false}},
      {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
      {"BEETS" => {:price => 2.50, :clearance => false}},
      {"AVOCADO" => {:price => 3.00, :clearance => true}},
      {"SOY MILK" => {:price => 4.50, :clearance => true}}
    
    ]
 coupons1 = 
 [
      {:item => "AVOCADO", :num => 2, :cost => 5.00},
      {:item => "BEER", :num => 2, :cost => 20.00},
      {:item => "CHEESE", :num => 3, :cost => 15.00}
    ] 
    
def cons_cart(cart)

  new_cart=Hash.new
  
  #new attempts using video for help  
  
  cart.each do |element_hash|
    element_key = element_hash.keys[0]
  
    if new_cart.has_key?(element_key)
      new_cart[element_key][:count] += 1
      
      #binding.pry
    else
      new_cart[element_key] = {
        price: element_hash[element_key][:price],
        clearance: element_hash[element_key][:clearance],
        count: 1 
      }
      end
    
  end
    return new_cart
    
end
  
def apply_coupons(cons_cart, coupons)
 
 
 
  
end

 #p cons_cart(cart1)

p apply_coupons(new_cart, coupons1)
