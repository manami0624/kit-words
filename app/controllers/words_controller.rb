class WordsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    Word.create(word_params)
  end

  private

  def word_params
    params.require(:word).permit(:korean, :japanese)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end