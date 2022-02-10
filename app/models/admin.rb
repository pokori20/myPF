class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:employee_id]
  validates_uniqueness_of :employee_id
  validates_presence_of :employee_id
    #No use email
  def email_required?
    false
  end

  def email_changed
    false
  end

  def will_save_change_to_email?
    false
  end
end
