class TermsController < ApplicationController
  
  def index
    @terms = Term.all
  end
  
  def show
    @term = Term.find(params[:id])
  end
  
  def new
    @term = Term.new
  end

  def edit
    @term = Term.find(params[:id])
  end
  
  def create
    @term = Term.new(term_params)
    if @term.save
      flash[:notice] = "Term successfully created"
      redirect_to @term
    else
      render 'new'
    end
  end
  
  def update
    @term = Term.find(params[:id])
      if @term.update_attributes(term_params)
        flash[:success] = "Term updated"
        redirect_to @term
      else
        render 'edit'
      end
  end

  def destroy
    @term = Term.find(params[:id])
    
  end
  
  private
    
    def term_params
      params.require(:term).permit(:name)
    end
    
end
