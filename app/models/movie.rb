class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, through: :roles

  validates :title, presence: true

  scope :american, -> { where(:nation => "USA") }

  def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end

  def audience_rating
  	rotten_finder.ratings.audience_score unless rotten_finder.empty?
  end

  def self.average_rating
  	scores = self.all.collect do |movie|
  		movie.audience_rating
  	end

  	scores.compact!

    if scores.length > 0
      scores.sum / scores.length
    else
      nil
    end
  end

  def self.french
    where(:nation => "France")
  end

  def self.japanese
    where(:nation => "Japan")
  end
  
  def snippet
    description.to_s.truncate 50
  end
end
