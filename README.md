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
    $ rvm install 2.0.0
    $ require 'json'

### Instrucciones

Descargar los ficheros .zip que se quiera analizar de [aquí][4] en /code.
Descomprimir los ficheros (obtendrás fichero .json).
Ejecutar los comandos que aparecen en cada fichero .rb con su estructura:

  $ ruby EdadesUsoBiciMad.rb FICHERO_W FICHEROs_R

De forma que puedes incluir cuantos ficheros .json quieras para analizar. El análisis de cada .json se guardará en el FICHERO_W a continuación.

ToDos:
- Analizar las estaciones más utilizadas.
- Analizar con carto las vías más transitadas.

[1]: https://twitter.com/jav0m0rales
[2]: https://datos.madrid.es/sites/v/index.jsp?vgnextoid=374512b9ace9f310VgnVCM100000171f5a0aRCRD&buscar=true&Texto=bicimad&Sector=&Formato=&Periodicidad=&orderByCombo=CONTENT_INSTANCE_NAME_DECODE
[3]: https://opendata.emtmadrid.es/
[4]: https://opendata.emtmadrid.es/Datos-estaticos/Datos-generales-(1)
