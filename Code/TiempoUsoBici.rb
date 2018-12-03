# ---------------------
# Conocer los usos de BiciMad en un mes concreto
# Recoge datos del fichero .json de opendata de EMT
#
# EJECUTAR:
# ruby Todo.rb FICHERO_W FICHEROs_R
#
# EJEMPLOs:
# ruby TiempoUsoBici.rb 201709_Usage_Bicimad.json TiempoUsoBici.csv
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

# TiempoUsoBici_201809.csv
file_w = File.open(ARGV[2], "a")
  
# 201809_Usage_Bicimad.json
File.open(ARGV[1], "r").each do |line|

  data = JSON.parse(line)

  if data["travel_time"] > 3600
    file_w.write("#{data["unplug_hourTime"]["$date"]} #{data["travel_time"]}\n")
    puts "#{data["unplug_hourTime"]["$date"]} #{data["travel_time"]}"
  end
end