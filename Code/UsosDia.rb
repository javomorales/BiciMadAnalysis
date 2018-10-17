# ---------------------
# Conocer los usos de BiciMad en un mes concreto
# Recoge datos del fichero .json de opendata de EMT
#
# EJECUTAR:
# ruby UsosDia.rb FICHERO_R FICHERO_W "AAAA-MM-DD"
#
# EJEMPLOs:
# ruby UsosDia.rb 201709_Usage_Bicimad.json UsosDia.csv "2017-09-27"
# ruby UsosDia.rb 201809_Usage_Bicimad.json UsosDia.csv "2018-09-27"
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

# ruby UsosDia.rb FICHERO_R FICHERO_W "AAAA-MM-DD"
file_w = File.open(ARGV[1], "a")

puts "***********************************************"
puts "------ Usos al dia -------"
puts "--------- #{ARGV[0]} #{ARGV[2]}-----------------"
puts "***********************************************"

hora = "00"
usos_dia = 0
fecha_ini = ARGV[2]

File.open(ARGV[0], "r").each do |line|

  data = JSON.parse(line)
  
  if data["unplug_hourTime"]["$date"][0..9] == fecha_ini
    
    if data["unplug_hourTime"]["$date"][11..12] == hora
      usos_dia = usos_dia + 1
    else
      puts "#{fecha_ini} #{hora}  #{usos_dia}"
      file_w.write("#{fecha_ini} #{hora}  #{usos_dia}\n")

      hora = data["unplug_hourTime"]["$date"][11..12]
      usos_dia = 0
    end
  end
end