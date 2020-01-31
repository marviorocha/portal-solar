class PowerGeneratorsController < ApplicationController
 
  require 'correios-frete'
 
  def index
    @power_generators = PowerGenerator.all.order(:name).page(params['page']).limit(6)
    @frete = Correios::Frete::Calculador.new
  end

  # Recomendation Power Gerador for user
  def new
    @gerador = PowerGenerator.new
  end
  
  def create

    format_to do |format|

      if @gerador.save

        format.html {redirect_to power_generator_path, notice: "Obrigado pela sua recomendação!"}
      else 
        format.html {redirect_to :new, alert: "Não foi possível gravar sua recomendação"}
      end

    end

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
