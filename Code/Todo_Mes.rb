# ---------------------
# Conocer los usos de BiciMad en un mes concreto
# Recoge datos del fichero .json de opendata de EMT
#
# EJECUTAR:
# ruby Todo.rb FICHERO_W FICHEROs_R
#
# EJEMPLOs:
# ruby Todo.rb 201704_Usage_Bicimad.json 
# ruby Todo.rb 201704_Usage_Bicimad.json 201705_Usage_Bicimad.json 201706_Usage_Bicimad.json 201707_Usage_Bicimad.json 201708_Usage_Bicimad.json 201709_Usage_Bicimad.json 201710_Usage_Bicimad.json 201711_Usage_Bicimad.json 201712_Usage_Bicimad.json 201801_Usage_Bicimad.json 201802_Usage_Bicimad.json 201803_Usage_Bicimad.json 201804_Usage_Bicimad.json 201805_Usage_Bicimad.json 201806_Usage_Bicimad.json 201807_Usage_Bicimad.json 201808_Usage_Bicimad.json 201809_Usage_Bicimad.json
#
# ---------------------

require 'json'

# 201806_Usage_Bicimad.json
if ARGV.length == 0
  puts "**************************"
  puts "Need to type json file to read data from and a file to write the data as an argument"
  puts "**************************"
  exit
end

cont = 0

while (cont < ARGV.length)

  puts "***********************************************"
  puts "------ Todo -------"
  puts "--------- #{ARGV[cont]} -----------------"
  puts "***********************************************"
  file_w = File.open("Todo_#{ARGV[cont]}.csv", "a")
  
  file_w.write("unplug_hourTime user_day_code idunplug_station idplug_station idunplug_base idplug_base user_type travel_time ageRange zip_code \n")
  
  contador = 0  
  
  File.open(ARGV[cont], "r").each do |line|

    data = JSON.parse(line)

    file_w.write("#{data["unplug_hourTime"]["$date"]} #{data["user_day_code"]} #{data["idunplug_station"]} #{data["idplug_station"]} #{data["idunplug_base"]} #{data["idplug_base"]} #{data["user_type"]} #{data["travel_time"]} #{data["ageRange"]} #{data["zip_code"]}\n")
    puts "#{data["unplug_hourTime"]["$date"]} #{data["user_day_code"]} #{data["idunplug_station"]} #{data["idplug_station"]} #{data["idunplug_base"]} #{data["idplug_base"]} #{data["user_type"]} #{data["travel_time"]} #{data["ageRange"]} #{data["zip_code"]}"
  end
    
  cont = cont+1

end