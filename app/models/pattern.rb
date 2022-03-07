class Pattern < ApplicationRecord
    with_options presence: true do
        validates :shift_pattern
        validates :hours
        #シフトパターンの記号はユニークネス
        with_options uniqueness: true do
            validates :alphabet
        end
  end
end
