class DictionariesController < ApplicationController
  before_action :set_dictionaries, only: [:index, :search]
  before_action :set_dictionary, only: [:destroy, :edit, :update]

  def index
    @dictionaries = current_user.dictionaries.order(created_at: :desc).page(params[:page])
    @total_posts = @dictionaries.total_count
    if params[:latest]
      @dictionaries = Dictionary.latest.page(params[:page]).per(1)
    elsif params[:old].present?
      @dictionaries=Dictionary.old.page(params[:page]).per(1)
    elsif params[:random].present?
      @dictionaries = Dictionary.random.page(params[:page]).per(1)
    else
      @dictionaries = Dictionary.all.page(params[:page]).per(1)
    end
  end

  def meaning
    @dictionary = Dictionary.find(params[:dictionary_id])
  end

  def new
    @dictionary = Dictionary.new
  end

  def create
    @dictionary = Dictionary.new(dictionary_params)
    if @dictionary.save
      render 'create'
    else
      render :new
    end
  end

  def destroy
    @dictionary.destroy
    render 'destroy'
  end

  def edit
  end

  def update
    if @dictionary.update(dictionary_params)
      render 'create'
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
      @total_posts = current_user.dictionaries.count
      @dictionaries = current_user.dictionaries.order(created_at: :asc).page(params[:page])
    else
      @total_posts = Dictionary.count
      @dictionaries = Dictionary.order(created_at: :asc).page(params[:page])
    end
  end

  def set_dictionary
    @dictionary = Dictionary.find(params[:id])
  end

  def dictionary_params
    params.require(:dictionary).permit(:vocabulary, :japanese, :meaning).merge(user_id: current_user.id)
  end
end