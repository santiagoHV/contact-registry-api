class Api::V1::CitiesController < ApplicationController
  #TODO: remove this line when configure CORS or use in production
  skip_before_action :verify_authenticity_token

  before_action :validate_params, only: [:create, :update]

  def initialize
    @cities_service = CitiesService.new
  end
  def index
    render json: @cities_service.get_cities, status: :ok
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def show
    city = @cities_service.get_city(params[:id])
    if city
      render json: city, status: :ok
    else
      render json: {error: "City not found"}, status: :not_found
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def create
    data = city_params

    city = @cities_service.create_city(data, params[:state_id])

    if city.valid?
      render json: city, status: :created
    else
      render json: {error: city.errors}, status: :unprocessable_entity
    end

  rescue ArgumentError => e
    render json: {error: e.message}, status: :unprocessable_entity
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def update
    data = city_params

    city = @cities_service.update_city(params[:id], data)

    if city.valid?
      render json: city, status: :ok
    else
      render json: {error: city.errors}, status: :unprocessable_entity
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def destroy
    city = @cities_service.delete_city(params[:id])

    if city
      render json: city, status: :ok
    else
      render json: {error: "City not found"}, status: :not_found
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  private
  def validate_params
    validator = CityParamsValidator.new(city_params)
    validator.validate
  rescue ArgumentError => e
    render json: {error: e.message}, status: :unprocessable_entity
  end
  def city_params
    params.require(:city).permit(:name, :state_id)
  end


end
