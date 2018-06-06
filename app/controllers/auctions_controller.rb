class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
    authorize @auctions
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def update
    if @auction.update(auction_params)
      redirect_to auction_path(@auction)
    else
      render :edit
    end
  end

  def delete
    @auction = Auction.find(params[:id])
    @auction.destroy
  end

   def list_bids(auction)
    auction.bids.first
  end


private

def auction_params
  params.require(:auction).permit(:starting_time, :ending_time, :fee_per_bid, :status, :min_number_bids, :product_id)
end

end
