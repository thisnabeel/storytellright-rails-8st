desc "This task will add beats"
task :add_beats => :environment do	

	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	require 'json'



	file = File.read('lib/beats.json')
	beats = JSON.parse(file)
	puts beats

	list = []
	beats.each do |beat|
		l = {
			"position"=>beat["id"], 
			"question_text"=>beat["title"], 
			"question_description"=>"Minute "+beat["id"].to_s+":<br>"+beat["short"], 
			"question_choices"=>[]
		}

		list.push(l)
	end

	Recipe.create(title: "Beats", details: list)

end

# {"position"=>"1", "question_text"=>"Let's try this", "question_description"=>"<p>One More Time!</p>", "question_choices"=>["yes", "no"]}
