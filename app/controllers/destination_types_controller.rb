class DestinationTypesController < ApplicationController
  def index
    @types = DestinationType.all
    respond_to do |format|
      format.html {  }
      format.json { render json: @types  }
      format.js   {  }
    end
  end

  def show
    @type = DestinationType.find(params[:id])
  end

  def new
    @type = DestinationType.new
  end

  def edit
    @type = DestinationType.find(params[:id])
  end

  def create
    @type = DestinationType.new(type_params)

    if @type.save
      redirect_to @type
    else
      render 'new'
    end
  end

  def update
    @type = DestinationType.find(params[:id])

    if @type.update(type_params)
      redirect_to @type
    else
      render 'edit'
    end
  end

  def destroy
    @type = DestinationType.find(params[:id])
    @type.destroy

    redirect_to destination_types_path
  end

  private
    def type_params
      params.require(:destination_type).permit(:name, :format_name, :description)
    end
end
