class Queries::CurrentUserQuery < GraphQL::Schema::Resolver
  graphql_name  'CurrentUser'

  type Types::UserType, null: true

  def resolve
    if context[:warden].authenticated?
      context[:warden].user
    else
      raise GraphQL::ExecutionError.new("No active session")
    end
  end
end
