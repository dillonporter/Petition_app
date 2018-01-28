class PetitionsController < ApplicationController

  def index
    @petitions = Petition.all
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def new
    @petition = Petition.new
  end

  def edit
    @petition = Petition.find(params[:id])
  end

  def create
    @petition = Petition.new(params.require(:petition).permit(:title, :body, [:name]))
    respond_to do |format|
      if @petition.save
        format.html { redirect_to petitions_path, notice: 'Your petition was created.' }
      else 
        format.html { render :new }
      end 
    end
  end

  def destroy
    @petition = Petition.find(params[:id])

    @petition.destroy

    respond_to do |format|
      format.html { redirect_to petitions_url, notice: 'Petition was deleted.' }
    end
  end
end
