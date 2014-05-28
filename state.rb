class State < ActiveRecord::Base

  #-- attributes

  attr_accessor :id, :name, :slug, :country_id

  #-- validations

  validates :name, uniqueness: true, presence: true

  #-- associations

  belongs_to :country
  has_many :cities

  #-- scopes

  scope :taxfree, ->() { where(tax_free: true) }

  #-- call backs

  before_validation :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end

  #-- class methods

  def self.sorted_by_name
  end

  #-- instance methods

  # Find a city by its name.
  #
  # ==== Parameters
  # * <tt>name</tt> - City name goes here.
  #
  # ==== Returns
  # * <tt>city</tt> - Returns City or nil.
  #
  # ==== Example
  # Try to use the method as described below.
  #
  #   state_1.find_city("valid city") #-- City
  #   state_1.find_city("invalid existing city") #-- nil
  def find_city(name)
  end

  private

  #-- private methods go here.

end
