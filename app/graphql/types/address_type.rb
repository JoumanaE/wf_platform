class Types::UserProfileType < GraphQL::Schema::Object
  graphql_name "User Profile"

  field :id, ID, "The id of this user", null: false
  field :email, String,  "The email of this user", null: false
  field :email, String,  "The email of this user", null: false
end