class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin

  def index
  end

  def new
    @word = Word.new
    Settings.answers_num_default.times {@word.answers.build}
    @category_id = params[:category_id]
    load_categories
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t "add_word"
      redirect_to :back
    else
      load_categories
      render :new
    end
  end

  private
  def word_params
    params.require(:word).permit :title, :category_id,
      answers_attributes: [:content, :is_correct,  :_destroy]
  end
end
