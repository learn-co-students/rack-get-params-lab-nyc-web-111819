class Application

  @@items = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end

    @@cart = ["Carrots", "Pears"]

    if req.path.match(/cart/)
      @@cart.each do |cart|
        resp.write "#{cart}\n"
      end
    elsif req.path.match(/add/)
      item_term = req.params["q"]
      resp.write add_cart(item_name)
    end



    resp.finish
  end

  def add_cart(item_term)
    if @@items.include?(item_term)
    item_term << @@cart
    return "#{item_term} added to your cart"
    else
      return "#{item_term} does not exist in our list of items. Please select item from our list to add to your cart"
    end
  end


  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end


  
end
