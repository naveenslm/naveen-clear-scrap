


require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
require 'httparty' 
require "simple-spreadsheet"
require 'addressable/uri'
module RailsAdminRoutesupload
end
module RailsAdmin
  module Config
    module Actions
      class Sync < RailsAdmin::Config::Actions::Base
        register_instance_option :link_icon do
          'icon-download'
        end
        register_instance_option :member do
          false
        end
        register_instance_option :collection do
          true
        end
        register_instance_option :http_methods do
         [:get, :post]
        end
         register_instance_option :controller do
          Proc.new do
            if request.post?
           route=Route.all
      
      count=0
     route.each do|rou|
      route_id=rou.id
      
      if(route_id>=35404)

         source=rou.from+","+rou.from_countrycode
      des=rou.to+","+rou.to_countrycode
     #o3SKL0vs
     #N3E6xcey
     #zn0278x2
      rou_type=rou.rou_type
      response=HTTParty.get("http://free.rome2rio.com/api/1.4/json/Search?key=N3E6xcey&oName=#{source}&dName=#{des}&currencycode=INR")
      #binding.pry
         
       if(response.present?)
        count=0
     rest=response["routes"]
      rest.each do|res|
      
        source_name=res["name"]
        from=response["places"][res["depPlace"]]["shortName"]
        from_lat=response["places"][res["depPlace"]]["lat"]
        from_lng=response["places"][res["depPlace"]]["lng"]
        to=response["places"][res["arrPlace"]]["shortName"]
        to_lat=response["places"][res["arrPlace"]]["lat"]
        to_lng=response["places"][res["arrPlace"]]["lng"]
        distance=res["distance"].to_s+"kms"
        duration=res["totalDuration"]
        hour=duration/60
        minu=duration%60
        time=hour.to_s+"h"+" "+minu.to_s+"m"

        
        if(source_name=="Drive")
          if(res["indicativePrices"].present?)
          min=res["indicativePrices"].last["price"] 
          max=res["indicativePrices"].first["price"] 
          price=res["indicativePrices"][1]["price"] 
          end
        elsif(source_name=="Bus, drive")||(source_name=="Fly to Sylhet, drive")||(source_name=="Fly to Agatti Island, travel")
           next 
        else
          if(res["indicativePrices"].present?)
          min=res["indicativePrices"].first["priceLow"]
           max=res["indicativePrices"].first["priceHigh"] 
           price=res["indicativePrices"].first["price"] 
      end
    end
         
         Source.create(name:source_name, from:from,from_lat:from_lat, from_lng:from_lng, to:to, to_lat:to_lat,to_lng:to_lng, distance:distance, time:time, min_price:min, max_price:max, price:price, route_id:route_id)
         source_id=Source.last.id
         res["segments"].each do|seg|
          seg_name=seg["segmentKind"]
         
         
            seg_from=response["places"][seg["depPlace"]]["shortName"]
        
          seg_from_lat=response["places"][seg["depPlace"]]["lat"]
          seg_from_lng=response["places"][seg["depPlace"]]["lng"]
          
         
           seg_to=response["places"][seg["arrPlace"]]["shortName"]
         
          seg_to_lat=response["places"][seg["arrPlace"]]["lat"]
          seg_to_lng=response["places"][seg["arrPlace"]]["lng"]
          veh_type=response["vehicles"][seg["vehicle"]]["name"]
          seg_dis=seg["distance"].to_s+"kms"
          seg_dur=seg["transitDuration"]
           seg_hour=seg_dur/60
        seg_minu=seg_dur%60
        seg_time=seg_hour.to_s+"h"+" "+seg_minu.to_s+"m"
        if(seg["indicativePrices"].present?)
       if(seg["indicativePrices"].first["priceLow"].present?)
         seg_min=seg["indicativePrices"].first["priceLow"]
           seg_max=seg["indicativePrices"].first["priceHigh"] 
           seg_price=seg["indicativePrices"].first["price"] 
            Segment.create(name:seg_name,from:seg_from,from_lat:seg_from_lat,from_lng:seg_from_lng,to:seg_to,to_lat:seg_to_lat,to_lng:seg_to_lng,distance:seg_dis,time:seg_time,veh_type:veh_type,price:seg_price,max:seg_max,min:seg_min,source_id:source_id)
         else
          seg_price=seg["indicativePrices"].first["price"] 
     Segment.create(name:seg_name,from:seg_from,from_lat:seg_from_lat,from_lng:seg_from_lng,to:seg_to,to_lat:seg_to_lat,to_lng:seg_to_lng,distance:seg_dis,time:seg_time,veh_type:veh_type,price:seg_price,source_id:source_id)    
       end
        
          end
         end
      end
     else
         count=count+1
        if(count<5)
        Todoroute.create(from:source,to:des,rou_id:route_id,rou_type:rou_type)
      
    else
      binding.pry
      end
     end


   
     end
     end

    end



           
          
      
              
           
          
        end
      end
    end
  end
end
end