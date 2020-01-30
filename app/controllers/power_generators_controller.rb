class PowerGeneratorsController < ApplicationController
 
  require 'correios-frete'
 
  def index
    @power_generators = PowerGenerator.all
    @frete = Correios::Frete::Calculador.new
  end

  #create Power Gerador for user
  def create

  end


  def search

  end


  private

  def generators_set
    @generators = PowerGenerator.find(params[:id])
  end

  def generators_params
    require.(:power_generators).permit(:id, :name, :description, :image_url, :manufacturer, :structure_type,
     :price, :height, :width, :lenght, :weight, :kwp)    
  end


end
