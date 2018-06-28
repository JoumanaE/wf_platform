class Types::ChildhoodHouseholdIncomeEnum < Types::BaseEnum
  graphql_name 'ChildhoodIncome'

  value 'LOWER_INCOME', 'Lower income', value: :lower_income
  value 'MIDDLE_INCOME', 'Middle income', value: :middle_income
  value 'UPPER_INCOME', 'Upper income', value: :upper_income
end