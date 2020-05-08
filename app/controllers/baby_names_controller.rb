class BabyNamesController < ApplicationController
  def index
    baby_names = BabyName.order("created_at DESC")
    render json: baby_names
  end

  def create

    baby_name = BabyName.create(baby_name_params)
    render json: baby_name
  end

  def update
    baby_name = BabyName.find(params[:id])
    baby_name.update_attributes(baby_name_params)
    render json: baby_name
  end

  private
  def baby_name_params
    params.require(:baby_name).permit(:name, :keep, :list_id)
  end
end
