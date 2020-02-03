class PowerGeneratorsController < ApplicationController
 
  #  require 'correios-frete' We not working with it for this moment right!
 
  require 'correios-cep' # Find CEP to User
  
  def index
    
    @power_generators = PowerGenerator.filter_name.page(params['page'])
     
  end
  
  def consultar
    
    @power_generators = PowerGenerator.find(params[:id])
    
    
    respond_to do |format|
    
    if params['cep'].present?
    @address = Correios::CEP::AddressFinder.get(params['cep'])
    @freight = Freight.find_by(state: @address[:state])
  end
   
    format.html {render :consultar, notice: 'Valor para o frete:'}
  
    end
      
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

  def kwp
    @power_generators = PowerGenerator.filter_kwp.page(params['page'])
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
