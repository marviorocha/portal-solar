class PowerGeneratorsController < ApplicationController
 
  require 'correios-frete'
 
  def index
    @power_generators = PowerGenerator.filter_name.page(params['page'])
    @frete = Correios::Frete::Calculador.new
  end


   def price_low

    @power_generators = PowerGenerator.filter_price_low.page(params['page'])
    render :index
  end 
  
  def price_hight

    @power_generators = PowerGenerator.filter_price_hight.page(params['page'])
    render :index
  end

  def name
    @power_generators = PowerGenerator.filter_name.page(params['page'])
    render :index
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
