class LineItem < ApplicationRecord
  belongs_to :cart, dependent: :destroy
end
