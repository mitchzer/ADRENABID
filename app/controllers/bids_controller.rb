class BidsController < ApplicationController
  def new
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.new
  end

  def create
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.new(bid_params)
    @bid.auction = @auction
    @bid.user = current_user
    if @bid.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

private

  def bid_params
    params.require(:bid).permit(:price)
  end
end
