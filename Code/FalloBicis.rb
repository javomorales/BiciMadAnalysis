# ---------------------
# Saber cuántas veces se deja una bici en la misma estación
# Es decir, la bici funciona mal
# Recoge datos de los fichero .json de opendata de EMT que se le pasen
#
# EJECUTAR:
# ruby FalloBici.rb FICHERO_W FICHEROs_R
# 
# EJEMPLOs:
# ruby FalloBici.rb DejarBiciMismaEstacion.csv 201806_Usage_Bicimad.json
# ruby DejarBiciMismaEstacion.rb DejarBiciMismaEstacion.csv 201704_Usage_Bicimad.json 201705_Usage_Bicimad.json 201706_Usage_Bicimad.json 201706_Usage_Bicimad.json 201707_Usage_Bicimad.json 201708_Usage_Bicimad.json 201709_Usage_Bicimad.json 201710_Usage_Bicimad.json 201711_Usage_Bicimad.json 201712_Usage_Bicimad.json 201801_Usage_Bicimad.json 201802_Usage_Bicimad.json
#
# ---------------------

require 'json'

if ARGV.length == 0
  puts "**************************"
  puts "Need to type json file to read data from and a file to write the data as an argument"
  puts "**************************"
  exit
end

file_w = File.open(ARGV[0], "a")
cont = 1

while (cont < ARGV.length)

  puts "***********************************************"
  puts "------ Veces que alguien deja la bici en la misma estación al mes -------"
  puts "--------- #{ARGV[cont]} -----------------"
  puts "***********************************************"

  # Veces que alguien deja la bici en la misma estación -> se entiende que porque está mal
  contador = 0  
  fecha_ini = ""
  
  File.open(ARGV[cont], "r").each do |line|
    data = JSON.parse(line)
	  
  	if data["unplug_hourTime"]["$date"][0..9] != fecha_ini
      
      if fecha_ini != ""
        puts "#{fecha_ini}  #{contador}"
	      file_w.write("#{fecha_ini}  #{contador} \n")
      end
      
      fecha_ini = data["unplug_hourTime"]["$date"][0..9]
      contador = 0
    else
    	if data["idunplug_station"] == data["idplug_station"]
    		contador = contador + 1
    	end
    end
  end
  
  puts "#{fecha_ini}  #{contador}"
  file_w.write("#{fecha_ini}  #{contador} \n")

  # en junio -> 10.114
  cont = cont+1
end