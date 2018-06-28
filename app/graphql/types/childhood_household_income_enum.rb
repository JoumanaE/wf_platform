class Types::RaceEthnicityEnum < Types::BaseEnum
  graphql_name 'RaceEthnicity'

  value 'AIAN', 'American Indian or Alaska Native', value: :american_indian_or_alaska_native
  value 'ASIAN', 'Asian', value: :asian
  value 'BLACK', 'Black or African American', value: :black
  value 'HLSO', 'Hispanic, Latino, or Spanish Origin', value: :hispanic_latino_or_spanish_origin
  value 'NHPI', 'Native Hawaiian or Other Pacific Islander', value: :native_hawaiian_or_other_pacific_islander
  value 'MENA', 'Middle Eastern or North African', value: :middle_eastern_or_north_african
  value 'WHITE', 'White', value: :white
  value 'OTHER', 'Other', value: :other
end