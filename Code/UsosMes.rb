# ---------------------
# Conocer los usos de BiciMad en un mes concreto
# Recoge datos del fichero .json de opendata de EMT
#
# EJECUTAR:
# ruby UsosMes.rb FICHERO_W FICHEROs_R
#
# EJEMPLOs:
# ruby UsosMes.rb UsosMes.csv 201806_Usage_Bicimad.json 
# ruby UsosMes.rb UsosMes.csv 201704_Usage_Bicimad.json 201705_Usage_Bicimad.json 201706_Usage_Bicimad.json 201706_Usage_Bicimad.json 201707_Usage_Bicimad.json 201708_Usage_Bicimad.json 201709_Usage_Bicimad.json 201710_Usage_Bicimad.json 201711_Usage_Bicimad.json 201712_Usage_Bicimad.json 201801_Usage_Bicimad.json 201802_Usage_Bicimad.json
#
# ---------------------

require 'json'

# 201806_Usage_Bicimad.json
if ARGV.lenght == 0
  puts "**************************"
  puts "Need to type json file to read data from and a file to write the data as an argument"
  puts "**************************"
  exit
end

file_w = File.open(ARGV[0], "a")
cont = 1

while (cont < ARGV.lenth)

  puts "***********************************************"
  puts "------ Usos al mes -------"
  puts "--------- #{ARGV[cont]} -----------------"
  puts "***********************************************"

  contador = 0  
  fecha_ini = ""
  
  File.open(ARGV[cont], "r").each do |line|

    data = JSON.parse(line)
	  
	  if data["unplug_hourTime"]["$date"][0..9] != fecha_ini

      if fecha_ini != ""
        puts "#{fecha_ini}  #{usos}"
        file_w.write("#{fecha_ini}  #{usos}\n")
      end

      fecha_ini = data["unplug_hourTime"]["$date"][0..9]
      usos = 0

    else
      usos = usos + 1
    end
  end
  
  puts "#{fecha_ini}  #{contador}"
  file_w.write("#{fecha_ini}  #{contador} \n")
  
  cont = cont+1
# -------- USOS -----------------
# en junio -> 326.998

end