class CountryParamsValidator < GenericValidator
  def initialize(params)
    @required_params = %w[name, phone_code, state_nomenclature]
    super(params, @required_params)
  end
end
