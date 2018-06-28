class Types::UserType < Types::BaseObject
  graphql_name "User"

  field :id, ID, "The id of this user", null: false
  field :email, String,  "The email of this user", null: false
  field :created_at, String,  "The date this user created an account", null: false
  field :user_profile, Types::UserProfileType, "The detailed profile information for this user", null: false
end