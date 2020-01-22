class Property < ApplicationRecord
  has_many :stations

  validates :name, presence: true, length: { in: 1..100 }
  validates :rent, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :address, presence: true
  validates :old, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
