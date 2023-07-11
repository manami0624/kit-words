class DictionariesController < ApplicationController
  before_action :set_dictionaries, only: [:index, :search]

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
    dictionary.destroy
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

  def search
    keyword = params[:keyword].to_s.strip
    if keyword.empty?
      redirect_to dictionaries_path
    else
      @dictionaries = Dictionary.search(keyword)
    end
  end


  private
  def set_dictionaries
    if user_signed_in?
      user_posts = current_user.dictionaries
      @total_posts = user_posts.count
      @dictionaries = user_posts.order(created_at: :asc).page(params[:page])
    else
      @total_posts = Dictionary.count
      @dictionaries = Dictionary.order(created_at: :asc).page(params[:page])
    end
  end

  def dictionary_params
    params.require(:dictionary).permit(:vocabulary, :meaning).merge(user_id: current_user.id)
  end
end
