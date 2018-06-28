class Mutations::Auth::PasswordForgotMutation < GraphQL::Schema::Mutation
  graphql_name  'Password Update'

  argument :password, String, description: "New password", required: true
  argument :token, String, description: "Password reset token", required: true

  field :result, Boolean, null: true

  def resolve(password:, token:)
    existing_user = User.with_reset_password_token(password)
    if existing_user
      if existing_user.reset_password(password, password) {
        { result: true }
        return
      }
      end
    end

    raise GraphQL::ExecutionError.new("Unable to reset password")
  end
end
