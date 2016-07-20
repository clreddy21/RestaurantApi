module Restaurants
  class Restaurants < Grape::API

    resource :get_restaurants_by_pin_code do
      desc 'List of orders of service provider'
      params do
        requires :pincode, type:Integer
      end

      get do
        restaurants = Restaurant.where(pincode: params[:pincode])
        orders = Order.includes(:customer).where(service_provider_id: params[:sp_id])
        orders_hash = []
        if !orders.blank?
          orders.each do |order|

            orders_hash << {:order_id => order.id, :customer_id => order.customer_id,
                            :customer_name => order.customer.full_name, :total_cost => order.total_cost.to_i,
                            :customer_mobile => order.customer.mobile, :status_id => order.status_id}
          end
        end
        orders_hash
      end
    end

  end
end
