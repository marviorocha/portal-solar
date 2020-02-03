class PowerGeneratorsController < ApplicationController
 
  require 'correios-frete'
  require 'correios-cep'
  def index
    
    @power_generators = PowerGenerator.filter_name.page(params['page'])
    frete = Correios::Frete::Calculador.new(:cep_origem => "04094-050",
      :cep_destino => params['cep'],
      :peso => 0.3,
      :comprimento => 30,
      :largura => 15,
      :altura => 2)
      
      @servico = frete.calcular :pac
      @sedex = frete.calcular_sedex
    
  end
  
  def consultar
    
    @power_generators = PowerGenerator.find(params[:id])
    @freight = Freight.find(params[:id])
   
    address = Correios::CEP::AddressFinder.get('27910-000')
    puts address
    frete = Correios::Frete::Calculador.new(
    :cep_origem => "69920-999", 
    :cep_destino => params['cep'],
    :peso => 0.3,
    :comprimento => 30,
    :largura => 15,
    :altura => 2)
    
    @servico = frete.calcular :pac
    @sedex = frete.calcular_sedex


  end

  # Filter for low price                                                                                                                                                              
   def price_low

    @power_generators = PowerGenerator.filter_price_low.page(params['page'])
    render :index
  end 
  
  # Filter for hight price
  def price_hight

    @power_generators = PowerGenerator.filter_price_hight.page(params['page'])
    render :index
  end

  # Filter for name
  def name
    @power_generators = PowerGenerator.filter_name.page(params['page'])
    render :index
  end


  # Recomendation Power Generators for user
  def new
    @power_generators = PowerGenerator.new
  end
  
  def create

    @power_generators = PowerGenerator.new(generators_params)

    respond_to do |format|

      if @power_generators.save
        format.html {redirect_to :index, notice: "Obrigado pela sua recomendação!"}
      else 
        format.html {render :new}
        flash.alert = @power_generators.errors.full_messages.to_sentence
      end

    end

  end

  # Seaching product by Name

  def search

  @power_generators = PowerGenerator.search_by_name(params['search']).page(params['page'])
  
  flash.now[:search] = "Pesquisando por: #{params['search']}"

  render :index
  end


  private



  def generators_set
    @generators = PowerGenerator.find(params[:id])
  end


  def generators_params
    params.require(:power_generator).permit(:name, :description, :picture, :manufacturer)    
  end

  def frete_params
  end


end
