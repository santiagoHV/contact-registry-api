class StatesService
  #TODO: Implement repository pattern?

  def get_states
    State.all
  end

  def get_state(id)
    State.find(id)

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def create_state(state_data, country_id)
    country = Country.find(country_id)

    raise ArgumentError.new("Country not found") unless country

    existing_state = country.states.find_by(name: state_data[:name])

    if existing_state
      raise ArgumentError.new("State already exists")
    end

    state_data[:country] = country

    State.create(state_data)
  end

  def update_state(id, state_data)
    state = State.find(id)
    state.update(state_data)

    state

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def delete_state(id)
    #TODO: add logic to deactivate instead of delete
    state = State.find(id)
    state.destroy

    state

  rescue ActiveRecord::RecordNotFound => e
    nil
  end
end
