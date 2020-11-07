class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )

    if user
      session[:user_id] = user.id
      render json: { 
        status: :created,
        user: user
      }
    else
      render json: { 
        status: 500,
        
       }
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: { status: 'SUCCESS', messages: 'User deleted', user: user }, status: :ok
    else
      render json: { status: 'ERROR', messages: 'User has not been deleted', errors: user.errors }, status: :unprocessable_entity
    end
  end
end