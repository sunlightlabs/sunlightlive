class Admin::UsersController < AdminController

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User saved."
      redirect_to admin_users_path
    else
      flash[:error] = "There was a problem saving the user."
      redirect_to admin_users_path
    end
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?

    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated."
      redirect_to admin_users_path
    else
      flash[:error] = "There was a problem saving the user."
      redirect_to admin_users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

end
