class User < ApplicationRecord
  has_one :user_profile

  enum role: [:user, :admin, :super_admin]

  after_initialize :init_new_user, if: :new_record?

  def init_new_user
    set_default_role
    create_default_profile
  end

  def create_default_profile
    self.user_profile ||= UserProfile.new
  end

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true
end
