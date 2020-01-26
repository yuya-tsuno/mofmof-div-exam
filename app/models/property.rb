class Property < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: :reject_station, allow_destroy: true

  validates :name, presence: true, length: { in: 1..100 }
  validates :rent, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :old, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def reject_station(attributes)
    exists = attributes[:id].present?
    # empty = attributes[:name].blank?
    empty = attributes[:name].blank? && attributes[:line].blank? && attributes[:time].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end

end
