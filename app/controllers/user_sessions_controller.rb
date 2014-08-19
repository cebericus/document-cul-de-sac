class UserSessionsController < ApplicationController
  before_action :require_user, only: [:destroy]
  
  layout "login"
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(_user_params)
    if @user_session.save
      flash[:notice] = "Login success."
      #redirect_to_session_or_default account_url
      redirect_to docs_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout success."
    redirect_to_session_or_default new_user_session_url
  end
  
  private
  def _user_params
    params.require(:user_session).permit(:login, :password)
  end
  
end
