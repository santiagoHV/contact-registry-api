class Web::DemoController < ApplicationController
  def initialize
    @countries_service = CountriesService.new
    @contacts_service = ContactsService.new
  end
  def index
    @countries = @countries_service.get_countries
    @contacts = @contacts_service.get_contacts

    render :index, layout: "application"
  end
end
