class Types::UserIdentitiesEnum < Types::BaseEnum
  graphql_name 'UserIdentities'

  value 'PARTNER', 'Partner', value: 'partner'
  value 'TEACHER', 'Teacher', value: 'teacher'
  value 'PARENT', 'Parent', value: 'parent'
end