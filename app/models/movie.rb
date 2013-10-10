class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, through: :roles
  validates :title, presence: true

  def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end

  def audience_rating
  	rotten_finder.ratings.audience_score unless rotten_finder.empty?
  end
  
  def snippet
    description.to_s.truncate 50
  end
end
