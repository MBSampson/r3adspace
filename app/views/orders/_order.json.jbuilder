json.extract! order, :id, :buyer_name, :seller_name, :payment_confirmed, :created_at, :updated_at
json.url order_url(order, format: :json)
