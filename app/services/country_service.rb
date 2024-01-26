class CountryService
  def get_countries
    Country.all
  end

  def get_country(id)
    Country.find(id)

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def create_country(params)
    existing_country = Country.find_by(name: params[:name])

    if existing_country
      raise ArgumentError.new("Country already exists")
    end

    Country.create(params)
  end

  def update_country(id, params)
    country = Country.find(id)
    country.update(params)

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