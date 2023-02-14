class Parcel < ApplicationRecord

  NUMBER_REGEXP = /\A(?<prefix>\d{3})?\s?(?<section>(\d{2})|([A-Z]{1,2}))\s(?<plan>(\d{1,4}|\d{1}[A-Z]{3}))\z/
  
end
