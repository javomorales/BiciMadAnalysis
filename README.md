# BiciMadAnalysis

Un análisis de los datos públicos de uso de BiciMad.

Por: javomorales - [@jav0m0rales][1]

Fuentes:
[datos.madrid.es][2] - [opendata.emtmadrid.es][3]

### Introducción

BiciMad es el servicio de bicicletas eléctricas de Madrid. Todos sus datos de uso han sido publicados por la EMT y se pueden descargar. Cuentan con ficheros .json que publican mensualmente [aquí][4]. Actualmente hay alrededor de 20 datasets en .json y cada uno ocupa casi 1 GB. Mucha información.

### Instalación

Usando Ruby 2.4.2.

Usar json:

    $ require 'json'

### Instrucciones

Descargar los ficheros .zip que se quiera analizar de [aquí][4] en /code.

Descomprimir los ficheros (obtendrás fichero .json).

Los ficheros .json tienen esta estructura:

        { "_id" : { "$oid" : "5b6779012f384302541d6813" }, "user_day_code" : "6c30d6e283ea7a160379fa9adb20b93d2c06e16853ad0804e26485e98066f6ba", "idplug_base" : 11, "track" : { "type" : "FeatureCollection", "features" : [ { "geometry" : { "type" : "Point", "coordinates" : [ -3.7078158, 40.4127144997222 ] }, "type" : "Feature", "properties" : { "var" : "28005,ES,Madrid,Madrid,CALLE SAN BRUNO 1,Madrid", "speed" : 6.19, "secondsfromstart" : 190 } }, { "geometry" : { "type" : "Point", "coordinates" : [ -3.7071841, 40.4156114997222 ] }, "type" : "Feature", "properties" : { "var" : "28012,ES,Madrid,Madrid,PLAZA MAYOR 27,Madrid", "speed" : 3.47, "secondsfromstart" : 130 } }, { "geometry" : { "type" : "Point", "coordinates" : [ -3.7048058, 40.4167895 ] }, "type" : "Feature", "properties" : { "var" : "28013,ES,Madrid,Madrid,CALLE ARENAL 1,Madrid", "speed" : 3.61, "secondsfromstart" : 71 } } ] }, "user_type" : 1, "idunplug_base" : 7, "travel_time" : 228, "idunplug_station" : 1, "ageRange" : 0, "idplug_station" : 43, "unplug_hourTime" : { "$date" : "2018-08-01T01:00:00.000+0200" }, "zip_code" : "" }

Muy bien explicada [aquí][5].

Ejecutar los comandos que aparecen en cada fichero .rb con su estructura:

    $ ruby EdadesUsoBiciMad.rb FICHERO_W FICHEROs_R

De forma que puedes incluir cuantos ficheros .json quieras para analizar. El análisis de cada .json se guardará en el FICHERO_W a continuación.

### Hecho:
1. Usos Día -> Usos de BiciMad en un día concreto, por horas.
2. Usos Mes -> Usos de BiciMad en un mes concreto.
3. Edades Uso -> Edades de uso del BiciMad.
4. Fallos Bicis -> Fallos que ha tenido el BiciMad, por las bicis que se cogen y se devuelven en la misma estación.

### ToDos:
- Analizar las estaciones más utilizadas.
- Analizar las vías más transitadas (con Carto).
- Un grafo (Gephi) de los tránsitos más utilizados de 7 a 10 y de 15 a 19.

[1]: https://twitter.com/jav0m0rales
[2]: https://datos.madrid.es/sites/v/index.jsp?vgnextoid=374512b9ace9f310VgnVCM100000171f5a0aRCRD&buscar=true&Texto=bicimad&Sector=&Formato=&Periodicidad=&orderByCombo=CONTENT_INSTANCE_NAME_DECODE
[3]: https://opendata.emtmadrid.es/
[4]: https://opendata.emtmadrid.es/Datos-estaticos/Datos-generales-(1)
[5]: https://opendata.emtmadrid.es/Documentos/Servicios-y-estructuras-Bicimad-V1-1.aspx
