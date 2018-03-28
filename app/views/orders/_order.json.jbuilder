json.extract! order, :id, :buyer_name, :seller_name, :payment_confirmed, :address, :state, :zipcode, :city, :created_at, :updated_at
json.url order_url(order, format: :json)
