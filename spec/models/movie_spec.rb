require 'spec_helper'

describe Movie do
	let(:movie) { Movie.new }
	let(:rotten_finder_return) { OpenStruct.new(ratings: OpenStruct.new(audience_score: 84)) }

	describe "#snippet" do
		context "when description is less than or equal to 50 characters" do
			it "returns the full description" do
				allow(movie).to receive(:description).and_return("blahblahblahblahblah")

				expect(movie.snippet).to eq(movie.description)
			end
		end

		context "when description is greater than 50 characters" do
			it "returns the first 47 characters and appends '...'" do
				allow(movie).to receive(:description).and_return("An offbeat romantic comedy about a woman who doesn't believe true love exists, and the young man who falls for her.")

				expect(movie.snippet).to eq("An offbeat romantic comedy about a woman who do...")
			end
		end

		context "when there is no description" do
			it "returns an empty string" do
				allow(movie).to receive(:description).and_return(nil)

				expect(movie.snippet).to eq("")
			end
		end
	end

	describe "#audience_rating" do
		context "when Movie is found on Rotten Tomatoes" do
		  it "returns the audience score for the Movie" do
		    allow(movie).to receive(:rotten_finder).and_return(rotten_finder_return)

		    expect(movie.audience_rating).to eq(84)
		  end
		end

		context "when Movie is no found on Rotten Tomatoes" do
		  it "returns nil" do
		    allow(movie).to receive(:rotten_finder).and_return([])

		    expect(movie.audience_rating).to eq(nil)
		  end
		end
	end
end
