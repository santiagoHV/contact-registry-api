class Api::V1::StatesController < ApplicationController
  #TODO: remove this line when configure CORS or use in production
  skip_before_action :verify_authenticity_token
  def initialize
    @states_service = StatesService.new
  end
  def index
    render json: @states_service.get_states, status: :ok
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def get_cities
    state = @states_service.get_state(params[:id])
    if state
      render json: state.cities, status: :ok
    else
      render json: {error: "State not found"}, status: :not_found
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def show
    state = @states_service.get_state(params[:id])
    if state
      render json: state, status: :ok
    else
      render json: {error: "State not found"}, status: :not_found
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def create
    data = state_params

    state = @states_service.create_state(data, params[:country_id])

    if state.valid?
      render json: state, status: :created
    else
      render json: {error: state.errors}, status: :unprocessable_entity
    end

  rescue ArgumentError => e
    render json: {error: e.message}, status: :unprocessable_entity
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def update
    data = state_params

    state = @states_service.update_state(params[:id], data)

    if state.valid?
      render json: state, status: :ok
    else
      render json: {error: state.errors}, status: :unprocessable_entity
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def destroy
    state = @states_service.delete_state(params[:id])

    if state
      render json: state, status: :ok
    else
      render json: {error: "State not found"}, status: :not_found
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  private
  def validate_params
    validator = StateParamsValidator.new(state_params)
    validator.validate
  rescue ArgumentError => e
    render json: {error: e.message}, status: :unprocessable_entity
  end
  def state_params
    params.require(:state).permit(:name, :country_id)
  end
end
