class DictionariesController < ApplicationController
  def index
    @dictionaries = Dictionary.all
    @total_posts = @dictionaries.count
    @dictionaries = Dictionary.all.order(created_at: :desc).page(params[:page])
  end

  def new
    @dictionary = Dictionary.new
  end

  def create
    @dictionary = Dictionary.new(dictionary_params)
    if @dictionary.save
      redirect_to dictionaries_path
    else
      render :new
    end
    @dictionaries = Dictionary.all
  end

  def destroy
    dictionary = Dictionary.find(params[:id])
    redirect_to dictionaries_path, notice: "単語が削除されました。"
  end

  def edit
    @dictionary = Dictionary.find(params[:id])
  end

  def update
    @dictionary = Dictionary.find(params[:id])
    if @dictionary.update(dictionary_params)
      redirect_to dictionaries_path, notice: "辞書を編集しました。"
    else
      render :edit
    end
  end

  private

  def dictionary_params
    params.require(:dictionary).permit(:vocabulary, :meaning).merge(user_id: current_user.id)
  end
end
