class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :destroy]

  def show
    @nickname = current_user.nickname
    @words = current_user.words.page(params[:page]).per(1)
    @total_posts = current_user.words.count
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
