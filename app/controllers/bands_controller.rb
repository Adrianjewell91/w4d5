class BandsController < ApplicationController
  before_action :require_logged_in

  def index
    @bands = Band.all
    render :index
  end

  def new
  end

  def create
  end

  def show
    @band = Band.find_by(id: params[:id])

    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
