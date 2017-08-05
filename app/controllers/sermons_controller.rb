class SermonsController < ApplicationController
  def index
    @sermon = Sermon.all
  end

  def show
   @sermon = Sermon.find(params[:id])
 end

 def new
  @sermon = Sermon.new
end

def create
  @sermon = Sermon.new(sermon_params)
  if @sermon.save
    redirect_to sermon_path(@sermon)
  else
    render :new
  end
end

def edit
  @sermon = Sermon.find(params[:id])
  @sermon.save
end

def update
  @sermon = Sermon.find(params[:id])
  @sermon.save
  if @sermon.update(sermon_params)

    redirect_to sermon_path(@sermon)
  else
    render :edit
  end
end

def destroy
  @sermon = Sermon.find(params[:id])
  @sermon.destroy
  redirect_to sermons_path
end

def sermon_params
  params.require(:sermon).permit(:title, :speaker, :speakdate, :description, :audio, :photo)
end
end
