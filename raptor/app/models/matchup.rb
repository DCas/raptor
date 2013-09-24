class Matchup < ActiveRecord::Base
  require 'net/http'
  require 'rexml/document'
  
	def self.get_weekly_schedule(week)
  		week = week.to_s
        	uri = URI.parse("http://api.sportsdatallc.org/nfl-t1/2013/REG/3/schedule.xml?api_key=dxd35qzuacv8g262jh4uhq6t")
        	http = Net::HTTP.new(uri.host, uri.port)
       	        request = Net::HTTP::Get.new(uri.request_uri)

        	response = http.request(request)

       	 	xml = response.body
	
		doc = REXML::Document.new xml
        	games = doc.get_elements('//game')

        	games.each do |game|
          	 time = game.attributes["scheduled"]
          	 home_symbol = game.attributes["home"]
          	 away_symbol = game.attributes["away"]
          
         	 m = Matchup.create( :week => week, :home_symbol => home_symbol, :away_symbol => away_symbol, :time => time)
       		 end
  	 end 
	
	def parse_time(datetime)
		datetime.strftime("%A  %I:%M %p %Z")
		
	end 
end
