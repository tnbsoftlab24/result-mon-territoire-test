class Intercommunality < ApplicationRecord
  before_save :add_slug, if: proc {|interco| interco.slug.nil? && name.present?}
  has_many :communes

  validates_presence_of :name, :siren
  validates_uniqueness_of :siren, :case_sensitive => false
  validates :siren, numericality: { only_integer: true }
  validates_length_of :siren, maximum: 9
  validates_inclusion_of :form, in: %w( ca cu cc met )


  def add_slug
    self.slug  =  name.parameterize
  end

  def communes_hash
    hashes = {}
    communes.each do |commune|
      hashes["#{commune.code_insee}"] = commune.name
    end
    hashes
  end

end
