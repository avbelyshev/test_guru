class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:initial_page] || root_path, notice: 'You have successfully logged in'
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    session[:initial_page] = nil
    redirect_to login_path, notice: 'Ah, why did you log out :('
  end
end
