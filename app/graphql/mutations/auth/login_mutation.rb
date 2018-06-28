class Mutations::Auth::LoginMutation < GraphQL::Schema::Mutation
  graphql_name  'Login'

  # Accessible from `inputs` in the resolve function:
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true

  def resolve(email:, password:)
    if context[:warden].authenticated?
      raise GraphQL::ExecutionError.new("Active session exists")
    end

    user = User.find_for_database_authentication(email: email)

    if user && user.valid_password?(password)
      context[:warden].set_user(user)
      { user: user }
    else
      raise GraphQL::ExecutionError.new("Wrong email or password")
    end
  end
end
