# Term Controller
class TermsController < ApplicationController
  before_action :set_term, only: :show
  before_action :require_login, only: :new


  def index
    @terms = Term.all
  end

  def show
  end

  def new
    @term = Term.new
    @term.definitions.new
  end

  def create
    @term = Term.new(term_params)
    @term.user_id = current_user.id
    @term.definitions.first.user_id = current_user.id
    if @term.save
      flash[:success] = 'Term created!'
      redirect_to @term
    else
      render 'new'
    end
  end

  private

  def set_term
    @term = Term.friendly.find(params[:id])
  end

  def term_params
    params.require(:term).permit(:name, :acronym, :user_id, definitions_attributes: [:meaning, :user_id])
  end
end
