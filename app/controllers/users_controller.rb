class UsersController < ApplicationController
  before_action :_check_admin_rights
  before_action :_set_user, only: [:show, :edit, :update, :destroy]
  
  layout "application"
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(_user_params)
      
    if params[:admin_rights] == "1"
      @user.add_role :admin
    end
    
    if @user.save
      flash[:notice] = "User " + @user.login + " created successfully."
      redirect_to root_url
    else
      render :action => "new"  
    end
  end
  
  def index
    @users = User.all
    @roles = Role.all
  end
  
  def show
    if current_user.has_role? :admin
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end


  def update
    respond_to do |format|
      if @user.update(_user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end
  
  private
    def _set_user
      @user = User.find(params[:id])
    end
    
    def _user_params
      params.require(:user).permit(:login, 
                                   :password, 
                                   :password_confirmation, 
                                   :admin_rights)
    end

end
