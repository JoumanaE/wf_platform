class Types::MutationType < Types::BaseObject
  field :authLogin, mutation: Mutations::Auth::LoginMutation
  field :authLogout, mutation: Mutations::Auth::LogoutMutation
  field :authRegister, mutation: Mutations::Auth::RegisterMutation
  field :authPasswordForgot, mutation: Mutations::Auth::PasswordForgotMutation
  field :authPasswordReset, mutation: Mutations::Auth::PasswordResetMutation

  field :userProfileUpdate, mutation: Mutations::UserProfiles::UpdateMutation
end
