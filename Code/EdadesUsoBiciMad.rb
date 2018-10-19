# ---------------------
# Conocer las edades de uso de BiciMad en un mes concreto
# Recoge datos del fichero .json de opendata de EMT
#
# EJECUTAR:
# ruby EdadesUsoBiciMad.rb FICHERO_W FICHEROs_R
# 
# EJEMPLOs:
# ruby EdadesUsoBiciMad.rb EdadesUsoBiciMad.csv 201806_Usage_Bicimad.json
# ruby EdadesUsoBiciMad.rb EdadesUsoBiciMad.csv 201704_Usage_Bicimad.json 201705_Usage_Bicimad.json 201706_Usage_Bicimad.json  201707_Usage_Bicimad.json 201708_Usage_Bicimad.json 201709_Usage_Bicimad.json 201710_Usage_Bicimad.json 201711_Usage_Bicimad.json 201712_Usage_Bicimad.json 201801_Usage_Bicimad.json 201802_Usage_Bicimad.json 201803_Usage_Bicimad.json 201804_Usage_Bicimad.json 201805_Usage_Bicimad.json 201806_Usage_Bicimad.json 201807_Usage_Bicimad.json 201808_Usage_Bicimad.json 201809_Usage_Bicimad.json
# ---------------------

require 'json'

# 201806_Usage_Bicimad.json
if ARGV.length == 0
  puts "**************************"
  puts "Need to type json file to read data from and a file to write the data as an argument"
  puts "**************************"
  exit
end

file_w = File.open(ARGV[0], "a")
cont = 1

file_w.write("FECHA -- ERR // 0-16 // 17-18 // 19-26 // 27-40 // 41-65 // 65")

while (cont < ARGV.length)

  puts "***********************************************"
  puts "------ Edades de uso de BiciMad -------"
  puts "--------- #{ARGV[cont]} -----------------"
  puts "***********************************************"
  puts "FECHA -- ERR // 0-16 // 17-18 // 19-26 // 27-40 // 41-65 // 65-"
  
# edades de uso
#0: No se ha podido determinar el rango de edad del usuario 1: El usuario tiene entre 0 y 16 años
#2: El usuario tiene entre 17 y 18 años
#3: El usuario tiene entre 19 y 26 años
#4: El usuario tiene entre 27 y 40 años 
#5: El usuario tiene entre 41 y 65 años 
#6: El usuario tiene 66 años o más

  edad = {"0" => 0, "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0}
  fecha_ini = ""

  File.open(ARGV[cont], "r").each do |line|

    data = JSON.parse(line)

	  if data["unplug_hourTime"]["$date"][0..9] != fecha_ini

      if fecha_ini != ""
        puts "#{fecha_ini}  #{edad["0"]}  #{edad["1"]}  #{edad["2"]}  #{edad["3"]}  #{edad["4"]}  #{edad["5"]}  #{edad["6"]}"
        file_w.write("#{fecha_ini}  #{edad["0"]}  #{edad["1"]}  #{edad["2"]}  #{edad["3"]}  #{edad["4"]}  #{edad["5"]}  #{edad["6"]}\n")
      end

  	  fecha_ini = data["unplug_hourTime"]["$date"][0..9]
  	  edad = {"0" => 0, "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0}
	  else
    	case data["ageRange"]
    		when 0
    			edad["0"] = edad["0"]+1
    		when 1
    			edad["1"] = edad["1"]+1			
    		when 2
    			edad["2"] = edad["2"]+1			
    		when 3
    			edad["3"] = edad["3"]+1			
    		when 4
    			edad["4"] = edad["4"]+1			
    		when 5
    			edad["5"] = edad["5"]+1			
    		else
    			edad["6"] = edad["6"]+1			
    	end
    end
  end
  puts "#{fecha_ini}  #{edad["0"]}  #{edad["1"]}  #{edad["2"]}  #{edad["3"]}  #{edad["4"]}  #{edad["5"]}  #{edad["6"]}"
  file_w.write("#{fecha_ini}  #{edad["0"]}  #{edad["1"]}  #{edad["2"]}  #{edad["3"]}  #{edad["4"]}  #{edad["5"]}  #{edad["6"]}\n")
  
  cont = cont + 1
end

# en junio 2018:
# => {"0"=>115685, "1"=>3040, "2"=>3896, "3"=>21476, "4"=>113826, "5"=>67452, "6"=>1623}
