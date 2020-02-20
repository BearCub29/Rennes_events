class AttendancesController < ApplicationController
  #before_action :authenticate_user, only: [:show]
  def index

  end
  def new
    @amount = (Event.find(params[:event_id]).price)*100
  end
  

  def create
    # Amount in cents
    @amount = (Event.find(params[:event_id]).price)*100
    
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
    

    @attendance = Attendance.new(event_id: params[:event_id], user_id: current_user.id, strip_customer_id: params[:stripeToken])  
    if @attendance.save 
      flash[:ok] = "Vous êtes bien isncrit à l'évenement!!!"
      redirect_to event_path(params[:event_id])# si ça marche, il redirige vers la page d'index du site
    else
      render new_event_attendance_path(params[:event_id])
    end  

  end



end