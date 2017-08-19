class PrayersController < ApplicationController
def index
    @prayer = Prayer.all
  end

  def show
   @prayer = Prayer.find(params[:id])
 end

 def new
  @prayer = Prayer.new
@prayer.user_id = current_user
end

def create
  @prayer = Prayer.new(prayer_params)

  if @prayer.save
    redirect_to prayers_path
  else
    render :new
  end
end

def edit
  @prayer = Prayer.find(params[:id])
  @prayer.save
end

def update
  @prayer = Prayer.find(params[:id])
  @prayer.save
  if @prayer.update(prayer_params)

    redirect_to prayers_path
  else
    render :edit
  end
end

def destroy

  @prayer = Prayer.find(params[:id])
   if current_user.admin?
  @prayer.destroy
  redirect_to prayers_path
else
redirect_to prayers_path
end

end

def prayer_params
  params.require(:prayer).permit(:id, :requestor,:recipient, :description, :date)
end
end
