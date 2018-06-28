class Types::AuthProviderInput < Types::BaseInputObject
  graphql_name "AuthProviderInput"

  argument :email, String, required: true
  argument :password, String, required: true
end
