class BirdsController < ApplicationController
  wrap_parameters format: []
  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # other controller actions here

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private
  # all methods below here are private

  def bird_params
    params.permit(:name, :species)
  end


end