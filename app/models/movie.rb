class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, :through => :roles
  
  def snippet
    self.description.truncate 50
  end
end
