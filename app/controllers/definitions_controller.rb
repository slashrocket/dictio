# Definition Controller
class DefinitionsController < ApplicationController
  before_action :set_term
  before_action :set_definition, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def new
    @definition = @term.definitions.new
  end

  def create
    @definition = @term.definitions.new(definition_params)
    @definition.user_id = current_user.id
    if @definition.save
      flash[:success] = 'Definition created!'
      redirect_to @term
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @definition.update_attributes(definition_params)
      flash[:success] = 'Definition updated!'
      redirect_to @term
    else
      render action: 'edit'
    end
  end

  def destroy
    @definition.destroy
    flash[:error] = 'Definition deleted!'
    redirect_to term_url(@term)
  end

  def vote_up
    vote = Vote.new
    current_user.vote_for(@definition)
    vote.save
  end

  def vote_down
    Vote.new
    current_user.vote_against(@definition)
    vote.save
  end

  private

  def set_term
    @term = Term.find(params[:term_id])
  end

  def set_definition
    @definition = @term.definitions.find(params[:id])
  end

  def definition_params
    params.require(:definition).permit(:meaning, :user_id)
  end
end
