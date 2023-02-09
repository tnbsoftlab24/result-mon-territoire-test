class CommunesController < ApplicationController
  require 'csv'


  def index
    @communes = Commune.all
    respond_to do |format|
      format.html {render nothing: true, status: 406}
      format.json { render json: @communes, status: 200 }
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=export_communes.csv"
      end
    end
  end

  def show
    @commune = Commune.where(:code_insee => params[:id]).first
    if @commune.nil?
      render json: @commune, status: :not_found
    end
  end

  def create
    @commune = Commune.create(params[:commune])
    if @commune.save
      respond_to do |format|
        render json: {data: @commune, status: 403}
      end
    else
      render json: @commune, status: :forbidden
    end
  end


  def update
    @commune = Commune.where(:code_insee => params[:id]).first
    if @commune.nil?
      render json: @commune, status: :not_found
    elsif params[:id] = @commune.code_insee && !params[:commune].present?
      head :bad_request
    else  
      @name = "Commune de "+@commune.name
      @commune_a = @commune.update_columns(name: @name)
      render json: @commune, status: :no_content
    end
  end

end
