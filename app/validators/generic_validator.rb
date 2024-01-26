class GenericValidator
  def initialize(params, required_params)
    @params = params
    @required_params = required_params
  end

  def validate
    missing_params = @required_params - @params.keys(&:to_sym)
    raise ArgumentError.new("Missing required params: #{missing_params.join(', ')}") unless missing_params.empty?
  end
end