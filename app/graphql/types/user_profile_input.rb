class Types::UserProfileInput < Types::BaseInputObject
  graphql_name "UserProfileInput"

  argument :identities, [Types::UserIdentitiesEnum], "The identities with which a user identifies", required: false
  argument :first_name, String, "The first name of this user", required: false
  argument :last_name, String, "The last name of this user", required: false
  argument :address, Types::AddressInput, "The address of this user", required: false
  argument :phone_number, String, "The phone number of this user", required: false
  argument :montessori_certified, Boolean, "If the user is montessori certified", required: false
  argument :montessori_certifying_body, [Types::MontessoriCertifyingBodyEnum], "The montessori certifying body for this user", required: false
  argument :race_and_ethnicity, [Types::RaceEthnicityEnum], "The race and ethnicity of this user", required: false
  argument :childhood_household_income, Types::ChildhoodHouseholdIncomeEnum, "The childhood household income this user", required: false
  argument :parents_highest_education, Types::ParentsHighestEducationEnum, "The highest education reached of this user's parents", required: false
end
