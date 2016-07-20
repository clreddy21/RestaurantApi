module Restaurants
  class Restaurants < Grape::API
    resource :get_restaurants_by_pin_code do
      desc 'List of orders of service provider'
      params do
        requires :pincode, type:Integer
      end

      get do
        restaurants = Restaurant.where(pincode: params[:pincode])
        
        restaurants_hash = []
        if !restaurants.blank?
          restaurants.each do |restaurant|
            restaurants_hash << {:name => restaurant.name, :mobile => restaurant.mobile, :address => restaurant.address, :rating => restaurant.rating, :pincode => restaurant.pincode}
          end
          restaurants_hash
        else
          {'success':false, message: 'invalid pincode'}
        end
      end
    end
  end
end
