class UsersController < ApplicationController
  before_action :set_user, :only => [:destroy]

  def index
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to root_path
  end
  
  private
  def set_user
    @user = User.find_by(:id => params[:id])
  end
end
