class Api::UsersController < ApplicationController

    def create 
        user = User.new(user_params)
        if user.save()
            render json: user ,status: :ok
        else
            render json: user ,status: :unprocessable_entity
        end
    end

    def show 
        user = User.find(params[:id])
        render json: user ,status: :ok
    end

    def index 
        users = User.all
        render json: users ,status: :ok
    end

    def destroy
        user = User.find(params[:id])

        if user.destroy
            render json: {}, status: :ok
        else
            render json: {}, status: :unprocessable_entity
        end
    end
    
    def update 
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user ,status: :ok
        else
            render json: user ,status: :unprocessable_entity
        end
    end
    
    def search
        users = User.all
        serched_users=[]
        users.each do |user|
            if user.first_name.include?(params[:id]) || user.first_name.include?(params[:id]) || user.first_name.include?(params[:id])
                serched_users << user
            end
        end
        render json: serched_users , status: :ok
    end

    private 
    def user_params
        params.require(:user).permit(:first_name,:last_name,:email)
    end
end
