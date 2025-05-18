class FetcherController < ApplicationController
	def fetch_quotes
		require 'nokogiri'
		require 'open-uri'
		require 'json'

		url = "https://www.brainyquote.com/search_results?q=#{params[:search]}"
		doc = Nokogiri::HTML(open(url))

		quotes = []

		doc.css('.bqQt').each do |q|
			hash = {}
			hash["quote"] = q.css(".b-qt").text
			hash["author"] = q.css(".bq-aut").text
			quotes.push(hash)
		end

		@quotes = quotes

		render json: @quotes
	end
end