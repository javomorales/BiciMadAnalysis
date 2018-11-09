# ---------------------
# Conocer los usos de BiciMad en un mes concreto
# Recoge datos del fichero .json de opendata de EMT
#
# EJECUTAR:
# ruby EstacionesVacias.rb FICHERO_R FICHERO_W
#
# EJEMPLOs:
# ruby EstacionesVacias.rb Bicimad_Estacions_201809.json EstacionesVacias.csv 

require 'json'

if ARGV.length == 0
  puts "**************************"
  puts "Need to type json file to read data from and a file to write the data as an argument"
  puts "**************************"
  exit
end

puts "***********************************************"
puts "------ EstacionesVacias -------"
puts "***********************************************"

file_w = File.open(ARGV[1], "a")
file_w.write("fecha id total_bases dock_bikes\n")

puts "fecha - id - total_bases - dock_bikes"

# file_r = File.open('Bicimad_Estacions_201809.json','r')

File.open(ARGV[0], 'r').each do |line|

  data = JSON.parse(line)
  
  data["stations"].each do |station|
  
    puts "#{data["_id"]} #{station["id"]} #{station["total_bases"]} #{station["dock_bikes"]}"
    file_w.write("#{data["_id"]} #{station["id"]} #{station["total_bases"]} #{station["dock_bikes"]} \n")
 
 end
end
