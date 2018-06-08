class AuctionsController < ApplicationController
  skip_before_action :authenticate_user!


  def index
    @auctions = policy_scope(Auction)
  end

  def show
    @auction = Auction.find(params[:id])
    authorize @auction
    if @auction.status == 2
      @user = @auction.winning_user
      UserMailer.auction_won(@user).deliver_now
    end
  end

  def new
    @auction = Auction.new
    authorize @auction
  end

  def create
    @auction = Auction.new(auction_params)
    authorize @auction
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def edit
    @auction = Auction.find(params[:id])
    authorize @auction
  end

  def update
    if @auction.update(auction_params)
      redirect_to auction_path(@auction)
    else
      render :edit
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    authorize @auction
    @auction.destroy
  end

   def list_bids(auction)
    auction.bids.first
  end


private

def auction_params
  params.require(:auction).permit(:starting_time, :ending_time, :fee_per_bid_cents, :status, :min_number_bids, :product_id, :price_step_cents, :photo)
end

end
