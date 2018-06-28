class Mutations::Auth::PasswordResetMutation < GraphQL::Schema::Mutation
  graphql_name  'PasswordReset'

  argument :token, String, description: "Password reset token", required: true
  argument :password, String, description: "New password", required: true

  field :result, Boolean, null: true

  def resolve(token:, password:)
    existing_user = User.with_reset_password_token(token)
    if existing_user
      if existing_user.reset_password(password, password)
        return { result: true }
      end
    end

    raise GraphQL::ExecutionError.new("Unable to reset password")
  end
end
