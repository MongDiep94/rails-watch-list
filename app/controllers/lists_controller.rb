class ListsController < ApplicationController
  before_action :set_list, only: %i[new create]

  def index
    @lists = List.all
  end

  def show
    @list = list.find(params[:name])
  end

  def new
    @list = List.new
  end


  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render lists_new_path
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
