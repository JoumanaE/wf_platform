class Types::ParentsHighestEducationEnum < Types::BaseEnum
  graphql_name 'ParentsHighestEducation'

  value 'DID_NOT_ATTEND_SCHOOL', 'Did not attend school', value: 'did_not_attend_school'
  value 'DID_NOT_GRADUATE_HIGH_SCHOOL', 'Did not graduate high school', value: 'did_not_graduate_high_school'
  value 'GRADUATED_HIGH_SCHOOL_OR_GED', 'Graduated high school or GED', value: 'graduated_high_school_or_ged'
  value 'SOME_COLLEGE', 'Some college', value: 'some_college'
  value 'GRADUATED_COLLEGE', 'Graduated college', value: 'graduated_college'
  value 'SOME_GRADUATE_SCHOOL', 'Some graduate school', value: 'some_graduate_school'
  value 'COMPLETED_GRADUATE_SCHOOL', 'Completed graduate school', value: 'completed_graduate_school'
end
