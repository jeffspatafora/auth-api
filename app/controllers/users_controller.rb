class UsersController < ApplicationController
  
  def index
    users = User.all 
    if current_user
      render json: users.as_json
    else
      render json: {}, status: :unauthorized 
    end
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      rend json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

end
