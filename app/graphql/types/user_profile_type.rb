class Types::UserProfileType < GraphQL::Schema::Object
  graphql_name "User Profile"

  field :first_name, String,  "The first name of this user", null: false
  field :last_name, String,  "The last name of this user", null: false
  field :address, Types::Address,  "The address of this user", null: true
  field :phone_number, String,  "The phonen umber of this user", null: false
end