# Term Controller
class TermsController < ApplicationController
  before_action :set_term, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :edit, :update, :destroy]

  def index
    @terms = Term.all
  end

  def show
  end

  def new
    @term = Term.new
    @term.definitions.new
  end

  def edit
  end

  def create
    @term = Term.new(term_params)
    @term.user_id = current_user.id
    @term.definitions.first.user_id = current_user.id
    if @term.save
      flash[:success] = 'Term created!'
      redirect_to terms_path
    else
      render 'new'
    end
  end

  def update
    if @term.update_attributes(term_params)
      flash[:success] = 'Term updated!'
      redirect_to @term
    else
      render 'edit'
    end
  end

  def destroy
    @term.destroy
    flash[:error] = 'Term deleted!'
    redirect_to root_url
  end

  private

  def set_term
    @term = Term.find(params[:id])
  end

  def term_params
    params.require(:term).permit(:name, :acronym, :user_id, definitions_attributes: [:meaning, :user_id])
  end
end
