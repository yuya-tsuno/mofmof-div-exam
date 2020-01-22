class Station < ApplicationRecord
  belongs_to :property

  validates :name, presence: true
  validates :line, presence: true
  validates :time, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
