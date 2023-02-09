class Commune < ApplicationRecord


  belongs_to :intercommunality, required: false
  has_many :streets

  validates_presence_of :name, :code_insee
  validates_length_of :code_insee, minimum: 5


  def self.search(name)
    if name
      name = name.downcase
      if name.scan(/[!@#$%^&*()_+{}\[\]:;'"\/\\?><.,]/).present? 
        results = where("name LIKE  ?", "#{name}")
      else
        results = where("name LIKE  ?", "%#{name}%")
      end
    end
  end

  def geometry
    
  end

  def self.to_hash
    hashes = Commune.all.map { |val| { "#{val.code_insee}" => val.name } }
    hashes = hashes.reduce({}, :merge)
  end
end