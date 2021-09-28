class RestaurantPizzasController < ApplicationController

    def create
        restaurant_pizza = RestaurantPizza.create!(price: params[:price], pizza_id: params[:pizza_id], restaurant_id: params[:restaurant_id])
        render json: restaurant_pizza.pizza, status: :created
        rescue ActiveRecord::RecordInvalid => e
            render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end

