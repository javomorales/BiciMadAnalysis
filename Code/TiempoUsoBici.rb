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
  # TiempoUsoBici_201809.csv
  file_w = File.open("Todo_#{ARGV[cont]}.csv", "a")
  
  file_w.write("unplug_hourTime user_day_code idunplug_station idplug_station idunplug_base idplug_base user_type travel_time ageRange zip_code \n")
  
  # 201809_Usage_Bicimad.json
  File.open(ARGV[cont], "r").each do |line|

    data = JSON.parse(line)

    if data["travel_time"] > 3600
      file_w.write("#{data["unplug_hourTime"]["$date"]} #{data["travel_time"]}\n")
      puts "#{data["unplug_hourTime"]["$date"]} #{data["travel_time"]}"
    end
  end

end