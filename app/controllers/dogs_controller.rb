class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end
  
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.valid?
      redirect_to dog_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private
  helper_method :current_dog
  def current_dog
    @current_dog ||= Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :description, :address)
  end
end
