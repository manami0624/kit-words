class WordsController < ApplicationController
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
end