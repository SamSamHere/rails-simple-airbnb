class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @new_flat = Flat.new(params[:id])
    @new_flat.save
  end

  def create
    # Take input,Whitelist
    @create_flat = Flat.new(para_validate)
    @create_flat.save
    # Redirect to show page, show new entry
    redirect_to flat_path(@create_flat)
  end

  def edit
    # Find the flat details to edit
    @flat = Flat.find(params[:id])
  end

  def update
    # Find Flat Details to change, via id
    @flat = Flat.find(params[:id])
    # Pass all the information to change
    @flat.update(para_validate)
    # Redirect to Show page  no need for update page
    redirect_to flat_path(@flat)
  end

  def destroy
    # Find the Restaurant to destroy, via id
    @flat = Flat.find(params[:id])
    @flat.destroy
    # Redirect to index page
    redirect_to flats_path
  end

  private

  def para_validate
    # (params[:flat]) but with whitelisting
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
