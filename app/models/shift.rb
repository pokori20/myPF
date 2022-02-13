class Shift < ApplicationRecord
  attachment :image
  belongs_to :shop
  
  with_options presence: true do
    validates :year_month
    validates :shop_id
    validates :image
  end
end
