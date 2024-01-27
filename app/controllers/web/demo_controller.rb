class Web::DemoController < ApplicationController
  def initialize
    @countries_service = CountriesService.new
  end
  def index
    @countries = @countries_service.get_countries

    render :index
  end
end
