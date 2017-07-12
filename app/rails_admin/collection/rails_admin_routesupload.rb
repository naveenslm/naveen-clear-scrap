require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
require 'httparty' 
require "simple-spreadsheet"
module RailsAdminRoutesupload
end
module RailsAdmin
  module Config
    module Actions
      class Routesupload < RailsAdmin::Config::Actions::Base
        register_instance_option :link_icon do
          'icon-upload'
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
           #response=HTTParty.get('https://raw.githubusercontent.com/David-Haim/CountriesToCitiesJSON/master/countriesToCities.json')
           #c=JSON.parse(response)   
           #file = SimpleSpreadsheet::Workbook.read("ct_cities.csv") 
          #s = SimpleSpreadsheet::Workbook.read(file)
          # c.each do |country,city|
            #coun=country
            #city.each do|c|

             ## coordinates=Geocoder.coordinates(c)

            #  City.find_or_create_by(city:c, country:coun, lat:coordinates[0], lng:coordinates[1])
            
            #end 

           #end  
          # s.first_row.upto(2) do |line|
             # data1 = s.cell(line, 1)
            #coordinates=Geocoder.coordinates(data1)
            ##City.find_or_create_by(city:data1, lat:coordinates[0], lng:coordinates[1])
           #end
           if request.post?
          
           file = params[:file]['file_xls'].tempfile.path
           read_file=params[:file][:file_xls].original_filename

            file_extention=read_file.split(".").last
            temp_file = File.open('tmp/sample.'+file_extention,'w'){|f| f.write(File.read(file)) }
            read_file = SimpleSpreadsheet::Workbook.read('tmp/sample.'+file_extention)
            read_file = SimpleSpreadsheet::Workbook.read(file)
            rou_type = "DD"
             read_file.first_row.upto(read_file.last_row-1) do |line|
              from = read_file.cell(line+100000, 1)
              to = read_file.cell(line+100000, 2)
              from_countrycode = "IN"
              to_countrycode = "IN"
           Route.create(from:from,to:to,from_countrycode:from_countrycode,to_countrycode:to_countrycode,rou_type:rou_type)
            
            if(line==50000)
              break
            end

      
          
          
          
          end
          end
        end
      end
    end
  end
end
end