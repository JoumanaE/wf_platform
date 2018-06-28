class Mutations::RegisterMutation < GraphQL::Schema::Mutation
  graphql_name  'Register'

  argument :authProvider, Types::AuthProviderInput, description: "AuthProvider Signup Data", required: true

  field :user, Types::UserType, null: true

  def resolve(auth_provider:)
    existing_user = User.find_by_email(auth_provider[:email])
    if existing_user
      raise GraphQL::ExecutionError.new("Email already taken")
    else
      user = User.create!(
        email: auth_provider[:email],
        password: auth_provider[:password]
      )

      if user
        context[:warden].set_user(user)
        { user: user }
      else
        raise GraphQL::ExecutionError.new("Could not create user")
      end
    end
  end
end
