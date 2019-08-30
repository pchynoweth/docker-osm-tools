# docker-osm-tools

## Overview

Docker image containing common OSM tools

## Included tools

* gdal-dev (including ogrinfo and ogr2ogr)
* osmctools (including osmconvert and osmfilter)
* osmium

## Example usage

Extract Greece from the planet download:

```bash
docker run -it -w /wkd -v $(pwd):/wkd pchynoweth/osm-tools osmium extract --bbox=17.682871,33.679590,30.404538,42.269466 -o greece.osm.pbf planet-latest.osm.pbf
```

Filter all buildings, highways and beaches from the extract:

```bash
docker run -w /wkd -v $(pwd):/wkd osm-tools osmium tags-filter -o greece-filtered.osm.pbf greece.osm.pbf building highway natural=beach
```
