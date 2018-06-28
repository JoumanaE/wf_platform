class Mutations::Auth::PasswordResetMutation < GraphQL::Schema::Mutation
  graphql_name  'Password Reset'

  argument :email, String, required: true

  field :result, Boolean, null: true

  def resolve(email:)
    existing_user = User.find_by_email(email)
    if existing_user
      User.send_reset_password_instructions
    end

    { result: true }
  end
end
