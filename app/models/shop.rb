class Shop < ApplicationRecord
  has_many :publics, dependent: :destroy
  has_many :submit_offs, dependent: :destroy
  has_many :shifts
  validates :shop_name, presence: true, uniqueness: true
end
