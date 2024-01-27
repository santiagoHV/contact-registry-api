class ContactParamsValidator < GenericValidator
  VALID_SEX= %w[M F N/A]
  def initialize(params)
    @required_params = %w[name lastname sex birthdate email address address_detail description city_id]
    super(params, @required_params)

    is_email_valid = validate_email
    is_birthdate_valid = validate_birthdate
    is_sex_valid = validate_sex

    unless is_email_valid
      raise ArgumentError.new("Invalid params for email")
    end

    unless is_birthdate_valid
      raise ArgumentError.new("Invalid params for birthdate")
    end

    unless is_sex_valid
      raise ArgumentError.new("Invalid params for sex")
    end

  end

  def validate_email
    email = @params[:email]
    return false if email.nil?
    return false if email.empty?
    return false unless email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    true
  end

  def validate_birthdate
    birthdate = @params[:birthdate]
    return false if birthdate.nil?
    return false if birthdate.empty?
    return false unless birthdate =~ /\A\d{4}-\d{2}-\d{2}\z/
    true
  end

  def validate_sex
    sex = @params[:sex]
    return false unless VALID_SEX.include? sex
    true
  end
end
