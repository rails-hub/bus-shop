class Admin::UsersController < ApplicationController
  
  before_filter :authenticate_admin!
  helper_method :sort_column, :sort_direction
  layout "admin"

  def index
    @users = User.where('deleted_at is null').order(sort_column + " " + sort_direction).paginate :page => params[:page], :per_page => 10
  end
  
  def new
    @user = User.new
    @permission = Permission.new
  end
  
  def create
    @user = User.new(params[:user])
    @permission = Permission.new(params[:permission])
    if @user.save
      @permission.user_id = @user.id
      @permission.save
      redirect_to(admin_users_path, :notice => "User Added Successfully!")
    else
      render :new, :notice => "There were some errors"
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @permission = Permission.find_by_user_id(@user.id)
  end
  
  def update
    if params[:user][:password].blank? or params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      @permission = Permission.find_or_initialize_by_user_id(@user.id)
      @permission.update_attributes(params[:permission])
      redirect_to(admin_users_path, :notice => "User Updated Successfully!")
    else 
      render :edit
    end
  end
  
  def destroy
    user = User.find(params[:id]) if params[:id].present?
    users = User.where(:id => eval(params[:ids])) if params[:ids].present?

    if user && user.update_attributes(deleted_at: db_time)
      flash[:notice] = "User Was Successfully Moved To Recycle Bin!"
    elsif users && users.each { |user| user.update_attributes(deleted_at: db_time) }
      flash[:notice] = "Users Were Successfully Moved To Recycle Bin!"
    else
      flash[:alert] = "Unable To Delete The User Records. Please Retry Or Contact Technical Support"
    end
    redirect_to admin_users_path     
  end
  
  def confirm_account
    @user = User.find(params[:id])
    method = "confirm!" unless @user.confirmed?
    method = "deactivate_account" if @user.confirmed?
    if @user.send(method)
      redirect_to(admin_users_path, :notice => "The User Account was Activated Successfully!")
    else 
      redirect_to admin_users_path, :alert => "Unable to activate this account! Perhaps it's already activated?"
    end
  end
 
end
