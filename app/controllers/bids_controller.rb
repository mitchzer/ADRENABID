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
    if current_user.wallet.balance_cents < @auction.fee_per_bid_cents
      flash.alert = "Recharge your wallet before !"
      redirect_to user_path(current_user)
    else
      if @bid.save
        new_balance = current_user.wallet.balance_cents - @auction.fee_per_bid_cents
        current_user.wallet.update(balance_cents: new_balance)
        redirect_to auction_path(@auction)
      else
        render :new
      end
    end
  end

private

  def bid_params
    params.require(:bid).permit(:price_cents)
  end
end
