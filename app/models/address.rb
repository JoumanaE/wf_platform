class Address < ApplicationRecord
  geocoded_by :address

  belongs_to :addressable, polymorphic: true

  after_validation :geocode

  def address
    [street, city, state, country, postal_code].compact.join(', ')
  end
end
