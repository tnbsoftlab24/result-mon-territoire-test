class Street < ApplicationRecord
  has_many :communes

  validates_presence_of :title
  validates_numericality_of :from, :allow_nil => true
  validates_numericality_of :to, :greater_than => :from, :allow_nil => true

end
