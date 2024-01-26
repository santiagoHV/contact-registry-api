class CitiesService
  #TODO: Implement repository pattern?

  def get_cities
    City.all
  end

  def get_city(id)
    City.find(id)

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def create_city(city_data, state_id)
    state = State.find(state_id)

    raise ArgumentError.new("State not found") unless state

    existing_city = state.cities.find_by(name: city_data[:name])

    if existing_city
      raise ArgumentError.new("City already exists")
    end

    city_data[:state] = state

    City.create(city_data)
  end

  def update_city(id, city_data)
    city = City.find(id)
    city.update(city_data)

    city

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def delete_city(id)
    #TODO: add logic to deactivate instead of delete
    city = City.find(id)
    city.destroy

    city

  rescue ActiveRecord::RecordNotFound => e
    nil
  end
end
