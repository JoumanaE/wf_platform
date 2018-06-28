class UserProfile < ApplicationRecord
  extend Enumerize # To support enum arrays

  belongs_to :user

  has_one_attached :avatar

  has_one :address, -> { where(addressable_type: 'user_address') }, as: :addressable, :dependent => :destroy
  has_one :envisioned_school_location, -> { where(addressable_type: 'envisioned_school_address') },class_name: 'Address', as: :addressable, :dependent => :destroy

  accepts_nested_attributes_for :address, :envisioned_school_location

  enumerize :identities, in: {
      partner: 0,
      teacher: 1,
      parent: 2
  }, multiple: true
  enumerize :montessori_certifying_body, in: {
      ami: 0,
      ams: 1
  }, multiple: true
  enumerize :race_and_ethnicity, in: {
      american_indian_or_alaska_native: 0,
      asian: 1,
      black: 2,
      hispanic_latino_or_spanish_origin: 3,
      native_hawaiian_or_other_pacific_islander: 4,
      middle_eastern_or_north_african: 5,
      white: 6,
      other: 7
  }, multiple: true
  enum childhood_household_income: {
      lower_income: 0,
      middle_income: 1,
      upper_income: 2
  }
  enum parents_highest_education: {
      did_not_attend_school: 0,
      did_not_graduate_high_school: 1,
      graduated_high_school_or_ged: 2,
      some_college: 3,
      graduated_college: 4,
      some_graduate_school: 5,
      completed_graduate_school: 6
  }

  after_initialize :init_new_user_profile, :if => :new_record?

  def init_new_user_profile
    set_default_interests
    set_default_race_and_ethnicity
  end

  def set_default_interests
    self.identities ||= []
  end

  def set_default_race_and_ethnicity
    self.race_and_ethnicity ||= []
  end

  def set_default_montessori_certifying_body
    self.montessori_certifying_body ||= []
  end
end
