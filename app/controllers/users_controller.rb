class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    # @words = current_user.words.page(params[:page]).per(1)
    @total_posts = current_user.words.count
    @user = User.find(params[:id])
    @words = @user.words # ユーザーと単語の間に関連付けがあると仮定しています
  end

end
