class Types::UserProfileType < Types::BaseObject
  graphql_name "UserProfile"

  field :identities, [Types::UserIdentitiesEnum], "The identities with which a user identifies", null: true
  field :first_name, String,  "The first name of this user", null: false
  field :last_name, String,  "The last name of this user", null: false
  field :address, Types::AddressType,  "The address of this user", null: true
  field :phone_number, String,  "The phone number of this user", null: true
  field :montessori_certified, Boolean, "If the user is montessori certified", null: false
  field :montessori_certifying_body, [Types::MontessoriCertifyingBodyEnum], "The montessori certifying body for this user", null: true
  field :race_and_ethnicity, [Types::RaceEthnicityEnum], "The race and ethnicity of this user", null: true
  field :childhood_household_income, Types::ChildhoodHouseholdIncomeEnum, "The childhood household income this user", null: true
  field :parents_highest_education, Types::ParentsHighestEducationEnum, "The highest education reached of this user's parents", null: true
end