

class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_params)

    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      render :new
    end
  end

  def approve
    render plain: 'hello'
  end


  private

  def cat_rental_params
    params.require(:cat_rental).permit(:cat_id, :start_date, :end_date)
  end
end
