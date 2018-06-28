class Mutations::Auth::PasswordForgotMutation < GraphQL::Schema::Mutation
  graphql_name  'PasswordForgot'

  argument :email, String, required: true

  field :result, Boolean, null: true

  def resolve(email:)
    existing_user = User.find_by_email(email)
    if existing_user
      begin
        existing_user.send_reset_password_instructions
      rescue => e
        Rails.logger.error(e.message)
      end
    end

    { result: true }
  end
end
