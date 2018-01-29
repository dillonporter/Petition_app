class PetitionsController < ApplicationController

  def index
    @petitions = Petition.most_popular
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def sign
    @petition = Petition.find(params[:id])

    @petition.increment!(:signature_count)
    redirect_to petition_path(@petition)
  end

  def new
    @petition = Petition.new
  end

  def edit
    @petition = Petition.find(params[:id])
  end

  def create
    @petition = Petition.new(petition_params)
    respond_to do |format|
      if @petition.save
        format.html { redirect_to petitions_path, notice: 'Your petition was created.' }
      else 
        format.html { render :new }
      end 
    end
  end

  def update
    @petition = Petition.find(params[:id])
    respond_to do |format|
      if @petition.update(petition_params)
        format.html { redirect_to petitions_path, notice: 'Petition successfully changed.' }
      else
        format.html { render :edit }
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

private
  def petition_params
    params.require(:petition).permit(:title, :body, :expiration_date)
  end  
end
