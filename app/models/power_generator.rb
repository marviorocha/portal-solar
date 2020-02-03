class PowerGenerator < ApplicationRecord
 

  # Validate form generator

  validates :name, :description, :image_url, :manufacturer, :price, :kwp, presence: true
  # validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 40 }
  # validates :width, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # validates :lenght, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  # validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000 }


  # Paginate  with limiter

  paginates_per 6

  # Scope to filter products

  scope :filter_name, -> {order(name: :asc)}
  scope :filter_kwp, -> {order(kwp: :asc)}
  scope :filter_price_hight, -> {order(price: :asc)}
  scope :filter_price_low, -> {order(price: :desc)}

 # Simple Seach for Name 

  scope :search_by_name, -> (name) { where("name like ?", "#{name}%")}



# for Advanced Searching 
  enum structure_type: %i[
    metalico
    ceramico
    fibrocimento
    laje
    solo
    trapezoidal
  ]

has_one_attached :picture


end
