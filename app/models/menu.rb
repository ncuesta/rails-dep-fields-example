class Menu < ApplicationRecord
  belongs_to :restaurant, inverse_of: :menus
  has_many :dishes, inverse_of: :menu

  validates :day, presence: true, uniqueness: { scope: :restaurant_id }

  enum :day, %i[monday tuesday wednesday thursday friday saturday sunday]

  def to_s
    day
  end
end
