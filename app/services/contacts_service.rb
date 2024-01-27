class ContactsService
  #TODO: Implement repository pattern?

  PERMITED_AGE = 18
  MAX_CONTACTS_PER_CITY = 3

  def get_contacts
    Contact.includes(:city).all
  end

  def get_grouped_contacts_by_city
    list = City.includes(:contacts).all

    formatted_list = list.map do |city|
      {
        city: city.name,
        contacts: city.contacts.map do |contact|
          {
            id: contact.id,
            name: contact.name,
            lastname: contact.lastname,
            birthdate: contact.birthdate,
            email: contact.email,
            address: contact.address,
            detail: contact.address_detail,
            description: contact.description,
          }
        end
      }
    end

    formatted_list


  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def get_contact(id)
    contact = Contact.includes(:city).find(id)

    formatted_contact = {
      id: contact.id,
      name: contact.name,
      lastname: contact.lastname,
      birthdate: contact.birthdate,
      email: contact.email,
      address: contact.address,
      detail: contact.address_detail,
      description: contact.description,
      city: {
        id: contact.city.id,
        name: contact.city.name,
        state: {
          id: contact.city.state.id,
          name: contact.city.state.name,
          country: {
            id: contact.city.state.country.id,
            name: contact.city.state.country.name,
          }
        }
      },
    }

    formatted_contact

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def create_contact(contact_data, city_id)
    birthdate = Date.parse(contact_data[:birthdate])
    today = Date.today
    age = today.year - birthdate.year - ((today.month > birthdate.month || (today.month == birthdate.month && today.day >= birthdate.day)) ? 0 : 1)

    raise ArgumentError.new("Age must be greater than #{PERMITED_AGE}") if age < PERMITED_AGE

    city = City.find(city_id)

    raise ArgumentError.new("City not found") unless city

    if city.contacts.count >= MAX_CONTACTS_PER_CITY
      raise ArgumentError.new("City has reached the maximum number of contacts")
    end

    existing_contact = Contact.find_by(email: contact_data[:email])

    if existing_contact
      raise ArgumentError.new("Email already registered")
    end

    Contact.create(contact_data)
  end

  def update_contact(id, contact_data)
    contact = Contact.find(id)
    contact.update(contact_data)

    contact

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def delete_contact(id)
    #TODO: add logic to deactivate instead of delete
    
    contact = Contact.find(id)
    contact.destroy

    contact
  end
end
