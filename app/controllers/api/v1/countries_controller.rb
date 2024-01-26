class Api::V1::CountriesController < ApplicationController
  #TODO: remove this line when configure CORS or use in production
  skip_before_action :verify_authenticity_token

  def initialize
    @country_service = CountryService.new
  end
  def index
    render json: @country_service.get_countries, status: :ok
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def show
    country = @country_service.get_country(params[:id])
    if country
      render json: country, status: :ok
    else
      render json: {error: "Country not found"}, status: :not_found
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def create
    data = country_params

    country = @country_service.create_country(data)

    if country.valid?
      render json: country, status: :created
    else
      render json: {error: country.errors}, status: :unprocessable_entity
    end

  rescue ArgumentError => e
    render json: {error: e.message}, status: :unprocessable_entity
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def update
    data = country_params

    country = @country_service.update_country(params[:id], data)

    if country.valid?
      render json: country, status: :ok
    else
      render json: {error: country.errors}, status: :unprocessable_entity
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def destroy
    country = @country_service.delete_country(params[:id])

    if country
      render json: country, status: :ok
    else
      render json: {error: "Country not found"}, status: :not_found
    end
  rescue ArgumentError => e
    render json: {error: e.message}, status: :unprocessable_entity
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  private
  def country_params
    params.require(:country).permit(:name)
  end
end
