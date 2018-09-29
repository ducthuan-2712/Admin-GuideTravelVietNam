class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    respond_to do |format|
      format.html {  }
      format.json { render json: @destinations  }
      format.js   {  }
    end
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
    @destination_types = DestinationType.all
  end

  def edit
    @destination = Destination.find(params[:id])
    @destination_types = DestinationType.all
  end

  def create
    @destination = Destination.new(type_params)
    @destination.destination_types = DestinationType.find(params[:destination][:destination_type_id])

    if @destination.save
      redirect_to @destination
    else
      render 'new'
    end
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.destination_types = DestinationType.find(params[:destination][:destination_type_id])

    if @destination.update(type_params)
      redirect_to @destination
    else
      render 'edit'
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy

    redirect_to destinations_path
  end

  private
    def type_params
      params.require(:destination).permit(
        :name, :format_name, :lat, :lng
      )
    end
end
