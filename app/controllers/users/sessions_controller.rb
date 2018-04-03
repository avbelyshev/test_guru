class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "#{t('.welcome')}, #{current_user}"
  end
end
