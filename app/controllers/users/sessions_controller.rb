class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hello, #{current_user}"
  end
end
