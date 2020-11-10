class SessionsController < ApplicationController
  include CurrentUserConcern
  def create
               
    begin
      @user = User.find_by!(email: params['user']['email'])
      if @user.try!(:authenticate, params['user']['password'])
        session[:user_id] = @user.id
        render json: { 
          status: :created, 
          logged_in: true, 
          user: @user
        }
      else
        render json: {  errors: 'Authentication failed. Please check your credentials.' }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e }, status: :unprocessable_entity
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end
end