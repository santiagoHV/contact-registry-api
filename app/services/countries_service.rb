class CountriesService
  #TODO: Implement repository pattern?
  def get_countries
    Country.all
  end

  def get_country(id)
    Country.find(id)

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def create_country(country_data)
    existing_country = Country.find_by(name: country_data[:name])

    if existing_country
      raise ArgumentError.new("Country already exists")
    end

    Country.create(country_data)


  end

  def update_country(id, country_data)
    country = Country.find(id)
    country.update(country_data)

    country

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def delete_country(id)
    #TODO: add logic to deactivate instead of delete
    country = Country.find(id)
    country.destroy

    country

  rescue ActiveRecord::RecordNotFound => e
    nil
  end
end