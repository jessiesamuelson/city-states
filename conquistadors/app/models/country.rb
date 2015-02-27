class Country < ActiveRecord::Base
  belongs_to :player
  has_many :country_resources
  has_many :resources, through: :country_resources

  # Add validation...employment,tax_rate cannot be more than 100 
  validates :employment, numericality: {less_than: 100}
  validates :tax_rate, numericality: {less_than: 100}


  # Active Record Callbacks!!
  before_create :set_population_and_wealth 
  after_create :set_resources

  def set_population_and_wealth
    self.population = rand(0..100)
    self.wealth = rand(0..100)
  end

  def set_resources
    resources = Resource.all
    resources.sample(rand(3..6)).each do |resource|
      assignment = self.country_resources.new({resource_id: resource.id})
      assignment.save
    end 
    self.country_resources.each do |cr|
      cr.quantity = rand(10..30)
      cr.save
    end
  end  


end
