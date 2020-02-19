class AttendancesController < ApplicationController
  #before_action :authenticate_user, only: [:show]
  def index

  end
  def new
    @amount = Event.find(params[:event_id]).price
  end
  def create
    # Amount in cents
    @amount = Event.find(params[:event_id]).price
    

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  def show
    
  end
  def edit
    
  end
  def update
      
  end
  
end