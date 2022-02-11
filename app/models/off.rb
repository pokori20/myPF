class Off < ApplicationRecord
  belongs_to :shop
  belongs_to :public
  validates :date, presence: true
end
