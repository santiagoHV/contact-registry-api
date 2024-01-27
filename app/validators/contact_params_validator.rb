class ContactParamsValidator < GenericValidator
  def initialize(params)
    @required_params = %w[name lastname sex birthdate email address address_detail description city_id]
    super(params, @required_params)
  end
end
