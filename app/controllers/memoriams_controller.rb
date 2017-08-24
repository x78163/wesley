class MemoriamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destsroy]
  def index
@memoriam = Memoriam.all
  end

  def new
  @memoriam = Memoriam.new
 end


  def create
 @memoriam = Memoriam.new(memoriam_params)


  if @memoriam.save
    redirect_to memoriams_path
  else
    render :new
  end
  end

  def edit
 @memoriam = Memoriam.find(params[:id])
  @memoriam.save
  end

  def update
 @memoriam = Memoriam.find(params[:id])
  @memoriam.save
  if @memoriam.update(memoriam_params)

    redirect_to memoriams_path
  else
    render :edit
  end
  end

  def destroy
 @memoriam = Memoriam.find(params[:id])
   if current_user.admin?
  @memoriam.destroy
  redirect_to memoriams_path
else
redirect_to memoriams_path
end
  end
  def memoriam_params
  params.require(:memoriam).permit(:id, :name, :commentor, :comment)
end
end
