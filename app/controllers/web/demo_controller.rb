class Web::DemoController < ApplicationController
  def initialize
    @countries_service = CountriesService.new
    @contacts_service = ContactsService.new
  end
  def index
    @countries = @countries_service.get_countries
    @contacts = @contacts_service.get_contacts
    @grouped_contacts = @contacts_service.get_grouped_contacts_by_city

    render :index, layout: "application"
  end

  def generate_pdf
    @grouped_contacts = @contacts_service.get_grouped_contacts_by_city

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "demo", template: 'web/demo/generate_pdf'   # Excluding ".pdf" extension.
      end
    end
  end
end
