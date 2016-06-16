# Definition Controller
class DefinitionsController < ApplicationController
  before_action :set_term
  before_action :set_definition, only: [:show, :edit, :update, :destroy]

  def index
    @definitions = @term.definitions
  end

  def show
  end

  def new
    @definition = @term.definitions.new
  end

  def create
    @definition = @term.definition.new(definition_params)
    if @definition.save
      redirect_to(@term,
                  notice: 'Definition created!')
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @definition.update_attributes(definition_params)
      redirect_to([@definition.term, @definition],
                  notice: 'Definition updated!')
    else
      render action: 'edit'
    end
  end

  def destroy
    @definition.destroy

    redirect_to(term_url(@term),
                notice: 'Definition deleted!')
  end

  private

  def set_term
    @term = Term.find(params[:term_id])
  end

  def set_definition
    @definition = @term.definitions.find(params[:id])
  end

  def definition_params
    params.require(:definition).permit(:meaning)
  end
end
