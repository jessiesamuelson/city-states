class Country < ActiveRecord::Base
  belongs_to :player

  # Active Record Callbacks!!
  after_create :set_population

  def set_population
    self.population = rand(0..100)
  end
  
end
