class Types::AddressType < Types::BaseObject
  graphql_name "Address"

  field :street, String, "The addresses street", null: false
  field :city, String, "The addresses city", null: false
  field :state, String, "The addresses city", null: false
  field :postal_code, String, "The addresses city", null: false
  field :country, String, "The addresses city", null: false
  field :latitude, Float, "The latitude of the location", null: true
  field :longitude, Float, "The longitude of the location", null: true
end