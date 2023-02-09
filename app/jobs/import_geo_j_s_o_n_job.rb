class ImportGeoJSONJob < ApplicationJob
  queue_as :default
  require 'json'


  def perform(geojson)
   

  end
end