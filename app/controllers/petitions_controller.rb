class PetitionsController < ApplicationController

  def index
    @petitions = Petition.all
  end

  def show 
  end

  def new
    @petition = Petition.new
  end

  def edit
  end

  def create
    @petitions = Petition.new(blog_params)

    respond_to do |format|
      if @petition.save
        format.html { redirect_to @petition, notice: 'Petition was successfully created.' }
        format.json { render :show, status: :created, location: @petition }
      else
        format.html { render :new }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end
def destroy
    @petition.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Petition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
