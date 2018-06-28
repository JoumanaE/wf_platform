class Mutations::UserProfiles::UpdateMutation < GraphQL::Schema::Mutation
  graphql_name 'UpdateMutation'

  argument :user_id, Integer, "The id of the user", required: true
  Types::UserProfileType::fields.map{|field| argument(field.graphql_name, field.type, field.description, required: false) }
end