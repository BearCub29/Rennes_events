class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update,:destroy]
  def index
    @events = Event.all
  end
  def new
    @event = Event.new

  end
  def create
    @event = Event.new(start_date: params[:start_date], duration: params[:duration],description: params[:description],title: params[:title],price: params[:price],location: params[:location],user_id: current_user.id)    # avec xxx qui sont les données obtenues à partir du formulaire
      if @event.save # essaie de sauvegarder en base @gossip
        redirect_to events_path# si ça marche, il redirige vers la page d'index du site
      else
        render new_event_path# sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
  end

  def show
    puts "&" *60
    puts params.inspect
    @event = Event.find(params[:id])
    
  end
  def edit 
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event_update = params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  if @event.update(event_update)
    redirect_to event_path(params[:id])
  else
    render :edit
  end
  end
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path

  end
  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to user_session_path 
    end
  end
end
