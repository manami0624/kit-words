class DictionariesController < ApplicationController
  def index
    @dictionaries = Dictionary.all
  end

  def new
    @dictionary = Dictionary.new
  end

  def create
    @dictionary = Dictionary.new(dictionary_params)
  end
end
