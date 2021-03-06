# Definition Controller
class DefinitionsController < ApplicationController
  before_action :set_term
  before_action :set_definition, only: [:vote_up, :unvote]
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

  def vote_up
    current_user.vote_for(@definition)
    @definition.score = @definition.plusminus
    @definition.save!
    respond_to do |format|
      format.js
    end
  end

  def unvote
    current_user.unvote_for(@definition)
    @definition.score = @definition.plusminus
    @definition.save!
    respond_to do |format|
      format.js
    end
  end

  private

  def set_term
    @term = Term.friendly.find(params[:term_id])
  end

  def set_definition
    @definition = @term.definitions.find(params[:id])
  end

  def definition_params
    params.require(:definition).permit(:meaning, :user_id)
  end
end
