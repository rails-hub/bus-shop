class DealerController < ApplicationController
  before_filter :authenticate_dealer!
  layout "new_desgin"
  
  def index
    @dealer = Dealer.find(current_dealer)
  end
  
  def edit
    @dealer = Dealer.find(current_dealer)
  end
  
  def show
    @dealer = Dealer.find(current_dealer)
  end
  
  def update
    @dealer = Dealer.find(current_dealer)
    if @dealer.update_attributes(params[:dealer])
      redirect_to(edit_dealer_path(@dealer), :notice => "Dealer Updated Successfully!")
    else
      render :edit
    end
  end
  
end
