class SermonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @sermon = Sermon.all
  end

  def show
   @sermon = Sermon.find(params[:id])
 end

 def new
  if current_user.admin?
  @sermon = Sermon.new
else
redirect_to sermons_path
end
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
  if current_user.admin?
  @sermon = Sermon.find(params[:id])
  @sermon.save
  else
redirect_to sermons_path
end
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
  if current_user.admin?
  @sermon = Sermon.find(params[:id])
  @sermon.destroy
  redirect_to sermons_path
   else
redirect_to sermons_path
end
end

def sermon_params
  params.require(:sermon).permit(:title, :speaker, :speakdate, :description, :audio, :photo)
end
end
