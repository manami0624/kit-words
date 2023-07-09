class WordsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to user_path(current_user)  
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def search
    keyword = params[:keyword].to_s.strip
    if keyword.empty?
      redirect_to root_path
    else
      @words = Word.search(keyword)
    end
  end

  private

  def word_params
    params.require(:word).permit(:korean, :japanese).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end