class PowerGenerator < ApplicationRecord
 
  validates :name, :description, :image_url, :manufacturer, :price, :kwp, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 40 }
  validates :width, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :lenght, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000 }


  # Paginate limiter

  paginates_per 6

  # Scope to filter products

  scope :filter_name, -> {order(name: :asc)}
  
  scope :filter_price_hight, -> {order(price: :asc)}
  scope :filter_price_low, -> {order(price: :desc)}



  enum structure_type: %i[
    metalico
    ceramico
    fibrocimento
    laje
    solo
    trapezoidal
  ]

end
