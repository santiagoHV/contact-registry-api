class ContactsService
  #TODO: Implement repository pattern?

  def get_contacts
    Contact.includes(:city).all
  end

  def get_contact(id)
    Contact.find(id)

  rescue ActiveRecord::RecordNotFound => e
    nil
  end

  def create_contact(contact_data, city_id)
    city = City.find(city_id)

    raise ArgumentError.new("City not found") unless city

    puts "city: #{city.inspect}"
    puts "contact_data: #{contact_data.inspect}"

    existing_contact = Contact.find_by(name: contact_data[:name])

    if existing_contact
      raise ArgumentError.new("Contact already exists")
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
