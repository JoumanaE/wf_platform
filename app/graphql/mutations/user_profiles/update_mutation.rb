class Mutations::UserProfiles::UpdateMutation < GraphQL::Schema::Mutation
  graphql_name 'userProfileUpdateMutation'

  argument :user_id, Integer, "The id of the user", required: true
  argument :user_profile, Types::UserProfileInput, description: "UserProfile data", required: true

  field :user_profile, Types::UserProfileType, null: true

  def resolve(user_id:, user_profile:)
    # TODO: Authorization logic should be moved to an enforceable policy (pundit)
    user = User.find_by_id(user_id)
    if user && user == context[:warden].user
      # TODO: I really don't like needing to hash the user_profile info and then modify it before updating so we can handle nested input objects (Address). Should find a more graceful way to handle this.
      user_profile_params = user_profile.to_h
      user_profile_params[:address_attributes] = user_profile_params.delete(:address) if user_profile_params.has_key? :address
      user.user_profile.update(user_profile_params)
      return { user_profile: user.user_profile }
    end
    raise GraphQL::ExecutionError.new("userId does not match current user")
  end
end