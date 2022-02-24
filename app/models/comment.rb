class Comment < ApplicationRecord
  validates :public_id, presence: true
  validates :year_month, presence:true
  validates :remarks, length:{ maximum: 50}
  belongs_to :public
end
