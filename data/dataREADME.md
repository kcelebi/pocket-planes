# Data README

All information about data file formats found here. All of the data files are .txt files for convenience when using with Processing.

## city.txt

``city.txt`` has 3 entries per line separated by two tabs (``\t\t``). Formatting might not make it seem that way, but I guarantee that that is the case. The first column has the city name, second column has its city code (assigned semi-arbitrarily), and the third column has the airport's level (0-gray, 1-blue, 2-red).

## planes.txt

``planes.txt`` has 6 entries per line separated by two tabs (``\t\t``) just as ``city.txt``. Columns in order are: plane name, passenger capacity, cargo capacity, range, velocity, weight. 

## prices.txt 

``prices.txt`` has 3 entries per line separated by two tabs (``\t\t``). This file contains information about the flight cost from location x to location y. First column is origin, second column is destination, third is price. The price from x to y is the same as y to x, so both don't need to be listed, however, they are for computational efficiency. 

## loc/EU_loc.txt and loc/NA_loc.txt

These files contain data on location of cities on the map. These were created using ![map-maker package](https://github.com/kcelebi/map-maker) specifically to suit the image ``map.png``. First column is the city name, second column is the x-coordinate, and third column is the y-coordinate. These coordinates are designed for Processing/JavaScript format, so (0,0) is top left corner and (width,height) is the bottom right. 