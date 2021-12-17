# Introducción

El presente proyecto tiene como objetivo analizar el dataset de coches usados en UK creado en Julio 2020 por el usuario 'Aditya' (https://www.kaggle.com/adityadesai13) a través de web scraping de portales de compraventa británicos.

https://www.kaggle.com/adityadesai13/used-car-dataset-ford-and-mercedes

En el dataset original se presentan trece ficheros CSV cuyo título de cada uno representa la marca o "manufacturer", con excepción de cuatro ficheros "cclass.csv", "focus.csv", "unclean cclass.csv" y "unclean focus.csv". Esto se debe a que el usuario desvia su análisis, haciendolo específico para dos de los modelos más vendidos en UK, el Ford Focus y Mercedes Clase C. Los ficheros que comienzan con "unclean" se interpretan como un paso previo al preprocesado donde el mismo usuario identifica tuplas que tienen valores perdidos o inconsistentes y las separa del conjunto específico de análisis.

Como nosotros queremos hacer un análisis global teniendo en cuenta todas las marcas y todos los manufacturers haremos un merge de los nueve ficheros restantes. Estos ficheros contienen las siguientes cabeceras:

model,year,price,transmission,mileage,fuelType,tax,mpg,engineSize

Al que le añadiremos el campo manufacturer en la primera "columna" que extraeremos del título de cada fichero. Para esto hemos utilizado el script Ruby (lenguaje de confianza) que podemos ver en la carpeta integration.

Los pasos para la replicación se muestran a continuación.

# Integración

Colocarnos en la carpeta "integration" en el presente proyecto, esta contiene el datasaset original (carpeta "archive"), posteriormente ejecutar:

```ruby integration.rb```

Podremos ver que se ha creado en nuestra raíz del proyecto el fichero aprox100KUsedCars.csv que la información de los precios en Julio 2020  de los distintos vehículos.

# Explicación del dataset

En este nos encontramos:

4 variables categóricas.

  * manufacturer: Fabricante del automóvil. Variable categórica nominal con 9 categorías diferentes.
  * model: Modelo del automóvil. Variable categórica nominal con 195 categorías diferentes.
  * transmission: Tipo de transmisión. Variable categórica nominal con 4 categorías. Transmisión manual, automática, semiautomática y otras.
  * fuelType: Tipo de combustible. Variable categórica nominal con 5 categorias. Diesel, eléctrico, híbrido, gasolina y otros.

6 variables numéricas
  
  * year: Año de matriculación del coche. Variable numérica discreta.
  * price:	Precio en Libras que se colocó en el portal de compraventa a fecha Julio 2020. Variable numérica continua.
  * mileage:	Millaje. Millas que el coche ha recorrido desde su puesta en funcionamiento. (En España utilizamos Kilometraje, porque medimos esta distancia en kilómetros). Variable numérica continua
  * tax:  Impuesto de circulación (en Libras). Dependiendo de los años del vehículo, emisión de gases (sobre todo) y otros factores este impuesto varía. Variable numérica continua
  * mpg:  Consumo de combutible del vehículo en millas por galon. Variable numérica continua
  * engineSize: Tamaño del motor en litros. Variable numérica continua.

_Tabla resumen de las variables numéricas_
<table class="table table-condensed">
<thead>
<tr class="header">
<th align="left">Variable</th>
<th align="right">Media</th>
<th align="right">Desviación Típica</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">year</td>
<td align="right">2017.088</td>
<td align="right">2.124</td>
</tr>
<tr class="even">
<td align="left">price</td>
<td align="right">16805.348</td>
<td align="right">9866.773</td>
</tr>
<tr class="odd">
<td align="left">mileage</td>
<td align="right">23058.914</td>
<td align="right">21148.524</td>
</tr>
<tr class="even">
<td align="left">tax</td>
<td align="right">120.300</td>
<td align="right">63.151</td>
</tr>
<tr class="odd">
<td align="left">mpg</td>
<td align="right">55.167</td>
<td align="right">16.139</td>
</tr>
<tr class="even">
<td align="left">engineSize</td>
<td align="right">1.663</td>
<td align="right">0.558</td>
</tr>
</tbody>
</table>

Tanto en las variables categóricas como numéricas no hay valores vacios, no quiere decir que la consistencia de los valores sea total. Esto está sujeto a test, ejemplo: 0 litros de capacidad de motor tendría sentido en un vehículo eléctrico pero no en un vehículo diesel.

## Ejemplo aleatorio del dataset.

<table class="table table-condensed">
<thead>
<tr class="header">
<th align="left">manufacturer</th>
<th align="left">model</th>
<th align="right">year</th>
<th align="right">price</th>
<th align="left">transmission</th>
<th align="right">mileage</th>
<th align="left">fuelType</th>
<th align="right">tax</th>
<th align="right">mpg</th>
<th align="right">engineSize</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">vauxhall</td>
<td align="left">Mokka X</td>
<td align="right">2019</td>
<td align="right">15300</td>
<td align="left">Manual</td>
<td align="right">4855</td>
<td align="left">Petrol</td>
<td align="right">145</td>
<td align="right">39.2</td>
<td align="right">1.4</td>
</tr>
<tr class="even">
<td align="left">vauxhall</td>
<td align="left">Astra</td>
<td align="right">2016</td>
<td align="right">8800</td>
<td align="left">Manual</td>
<td align="right">30223</td>
<td align="left">Diesel</td>
<td align="right">0</td>
<td align="right">76.3</td>
<td align="right">1.6</td>
</tr>
<tr class="odd">
<td align="left">vw</td>
<td align="left">Polo</td>
<td align="right">2017</td>
<td align="right">9900</td>
<td align="left">Manual</td>
<td align="right">24000</td>
<td align="left">Petrol</td>
<td align="right">150</td>
<td align="right">60.1</td>
<td align="right">1.2</td>
</tr>
<tr class="even">
<td align="left">vw</td>
<td align="left">Scirocco</td>
<td align="right">2017</td>
<td align="right">17000</td>
<td align="left">Manual</td>
<td align="right">12377</td>
<td align="left">Diesel</td>
<td align="right">145</td>
<td align="right">53.3</td>
<td align="right">2.0</td>
</tr>
<tr class="odd">
<td align="left">merc</td>
<td align="left">C Class</td>
<td align="right">2019</td>
<td align="right">26399</td>
<td align="left">Semi-Auto</td>
<td align="right">7645</td>
<td align="left">Petrol</td>
<td align="right">145</td>
<td align="right">47.1</td>
<td align="right">1.5</td>
</tr>
<tr class="even">
<td align="left">audi</td>
<td align="left">Q3</td>
<td align="right">2017</td>
<td align="right">20690</td>
<td align="left">Semi-Auto</td>
<td align="right">17787</td>
<td align="left">Diesel</td>
<td align="right">150</td>
<td align="right">53.3</td>
<td align="right">2.0</td>
</tr>
<tr class="odd">
<td align="left">hyundi</td>
<td align="left">I10</td>
<td align="right">2019</td>
<td align="right">9250</td>
<td align="left">Manual</td>
<td align="right">3500</td>
<td align="left">Petrol</td>
<td align="right">145</td>
<td align="right">49.6</td>
<td align="right">1.0</td>
</tr>
<tr class="even">
<td align="left">toyota</td>
<td align="left">Corolla</td>
<td align="right">2019</td>
<td align="right">21450</td>
<td align="left">Automatic</td>
<td align="right">9244</td>
<td align="left">Hybrid</td>
<td align="right">140</td>
<td align="right">85.6</td>
<td align="right">1.8</td>
</tr>
</tbody>
</table>





