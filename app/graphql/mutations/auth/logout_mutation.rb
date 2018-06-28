class Mutations::LogoutMutation < GraphQL::Schema::Mutation
  graphql_name  'Logout'

  field :result, Boolean, null: false

  def resolve()
    if context[:warden].authenticated?
      context[:warden].logout
      { result: true }
    else
      raise GraphQL::ExecutionError.new("No active session")
    end
  end
end
