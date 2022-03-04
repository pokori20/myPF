class Pattern < ApplicationRecord
    with_options presence: true do
    validates :alphabet
    validates :hours
    validates :shift_pattern
  end
end
