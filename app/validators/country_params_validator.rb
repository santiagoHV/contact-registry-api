class CountryParamsValidator < GenericValidator
  def initialize(params)
    @required_params = %w[name]
    super(params, @required_params)
  end
end
