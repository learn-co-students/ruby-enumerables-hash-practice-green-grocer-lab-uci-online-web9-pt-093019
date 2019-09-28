require 'pry'

def consolidate_cart(cart)
  new_cart=Hash.new
  
  cart.each do |element_hash|
    element_key = element_hash.keys[0]
   
    if new_cart.has_key?(element_key)
      new_cart[element_key][:count] += 1
    else
      new_cart[element_key] = {
        price: element_hash[element_key][:price],
        clearance: element_hash[element_key][:clearance],
        count: 1 
      }
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item]
      if cart[item][:count] >= coupon[:num] && ! cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num]}
        cart[item][:count] -= coupon[:num]
        elsif cart[item][:count] >= coupon[:num] && cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"][:count] += coupon[:num]
        cart[item][:count] -= coupon[:num]
      end
    
    end
    
    #binding.pry
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do |product_key, product_value|
    if product_value[:clearance] == true
      product_value[:price] -= product_value[:price] * 0.2 
      
    end
    
  end
  cart
  
end

def checkout(cart, coupons)
  # code here
  hash_cart = consolidate_cart(cart)
  applied_coupons = apply_coupons(hash_cart, coupons)
  applied_clearance = apply_clearance(applied_coupons)
  
  total = applied_clearance.reduce(0) {|acc, (key, value)|
    acc += value[:price] * value[:count] }
    
    if total > 100.0 
      total = total * 0.9
    end
    
    total
  
end
