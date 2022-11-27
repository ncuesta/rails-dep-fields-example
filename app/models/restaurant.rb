class Restaurant < ApplicationRecord
  has_many :menus, inverse_of: :restaurant

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
