require 'csv'
require 'rubygems'
require 'httparty' 
# Rake task for generating required csv files
namespace :csv_file do

    desc "insert various sources of routes"
    task insert_poi: :environment do

     route=Route.all
     
     route.each do|rou|
      source=rou.from
      des=rou.to
      route_id=rou.id
      response=HTTParty.get("http://free.rome2rio.com/api/1.4/json/Search?key=qOmmqlid&oName=#{source}&dName=#{des}&currencycode=INR")
     
     rest=response["routes"]
      rest.each do|res|
      
      	source_name=res["name"]
      	from=response["places"][res["depPlace"]]["shortName"]
      	to=response["places"][res["arrPlace"]]["shortName"]
      	
      	distance=res["distance"].to_s+"kms"
      	duration=res["totalDuration"]
        hour=duration/60
        min=duration%60
        time=hour.to_s+"h"+" "+min.to_s+"m"

      	
      	if(source_name=="Drive")
          min=res["indicativePrices"].last["price"]
        else
      	min=res["indicativePrices"].first["priceLow"]
    end
      	 
      	 Source.create(name:source_name, from:from, to:to, distance:distance, time:time, min_price:min, route_id:route_id)
      end
     
     end



    	
    end

end

