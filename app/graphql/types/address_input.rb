class Types::AddressInput < Types::BaseInputObject
  graphql_name "AddressInput"

  argument :street, String, "The addresses street", required: false
  argument :city, String, "The addresses city", required: false
  argument :state, String, "The addresses city", required: false
  argument :postal_code, String, "The addresses city", required: false
  argument :country, String, "The addresses city", required: false
end