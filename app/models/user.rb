class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # REMEBER TO ADD :confirmable FOR EMAIL

  # Define roles
  ROLES = %i[student admin content_creator]

  # Set default role
  after_initialie :set_default_role, if: :new_record?


  def set_default_role
    self.role ||= :student
  end

  # Methods to check user role
  def student?
    role == "student"
  end

  def admin?
    role == "admin"
  end

  def content_creator?
    role == "content_creator"
  end
end
