class ContactParamsValidator < GenericValidator
  def initialize(params)
    @required_params = %w[name birthdate email address address_detail city_id]
    super(params, @required_params)
  end
end
