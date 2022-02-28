class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:employee_id]
  validates :employee_id, presence: true, uniqueness: true
  with_options presence: true do
    validates :shop_id
    validates :name
  end
  enum role: { general: 1, admin: 99 }
  has_many :offs
  has_many :comments
  belongs_to :shop
  # mail無しログイン実装のため
  def email_required?
    false
  end

  def email_changed
    false
  end

  def will_save_change_to_email?
    false
  end
  
    # 退職済のアカウントでのログインを防ぐため
  def active_for_authentication?
    super && (is_working == true)
  end
  
end
