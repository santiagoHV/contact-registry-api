class Api::V1::ContactsController < ApplicationController
  #TODO: remove this line when configure CORS or use in production
  skip_before_action :verify_authenticity_token

  before_action :validate_params, only: [:create, :update]

  def initialize
    @contacts_service = ContactsService.new
  end

  def index
    render json: @contacts_service.get_contacts, status: :ok
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def show(id)
    contact = @contacts_service.get_contact(id)
    if contact
      render json: contact, status: :ok
    else
      render json: {error: "Contact not found"}, status: :not_found
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def create
    data = contact_params
    city_id = data[:city_id]

    contact = @contacts_service.create_contact(data, city_id)

    if contact.valid?
      render json: contact, status: :created
    else
      render json: {error: contact.errors}, status: :unprocessable_entity
    end

  rescue ArgumentError => e
    render json: {error: e.message}, status: :unprocessable_entity
  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def update
    data = contact_params
    id = params[:id]

    contact = @contacts_service.update_contact(id, data)

    if contact.valid?
      render json: contact, status: :ok
    else
      render json: {error: contact.errors}, status: :unprocessable_entity
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  def delete(id)
    contact = @contacts_service.delete_contact(id)

    if contact
      render json: contact, status: :ok
    else
      render json: {error: "Contact not found"}, status: :not_found
    end

  rescue StandardError => e
    render json: {error: e.message}, status: :internal_server_error
  end

  private
  def validate_params
    validator = ContactParamsValidator.new(contact_params)
    validator.validate
  rescue ArgumentError => e
    render json: {error: e.message}, status: :unprocessable_entity
  end
  def contact_params
    params.require(:contact).permit(:name, :email, :birthdate, :address, :address_detail, :city_id)
  end
end
