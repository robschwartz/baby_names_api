class BabyNamesController < ApplicationController
  def index
    puts params
    list = List.find_or_create_by(code: params["list_id"])
    baby_names = list.baby_names.order("created_at DESC")
    render json: {baby_names: baby_names, list: list}
  end

  def create
    puts params
    baby_name = BabyName.create(baby_name_params)
    baby_names = BabyName.where(list_id: params['baby_name']['list_id']).order("created_at DESC")
    render json: {baby_names: baby_names, error: baby_name.errors.full_messages}
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
