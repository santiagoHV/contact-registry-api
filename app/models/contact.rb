class Contact < ApplicationRecord
  belongs_to :city

  validates :name, presence: true
  validates :city_id, presence: true
  validates :address, presence: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
