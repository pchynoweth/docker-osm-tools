# docker-osm-tools

## Overview

Docker image containing common OSM tools

## Included tools

* [geobuf](https://github.com/mapbox/geobuf)
* [geo2topo](https://github.com/topojson/topojson-server)
* [gdal-dev](https://github.com/OSGeo/gdal) (including ogrinfo and ogr2ogr)
* [mapshaper](https://github.com/mbloch/mapshaper)
* [osmctools](https://gitlab.com/osm-c-tools/osmctools) (including osmconvert and osmfilter)
* [osmium](https://github.com/osmcode/osmium-tool)
* [tippecanoe](https://github.com/mapbox/tippecanoe) (Copyright (c) 2014, Mapbox Inc.)
* [topo2geo](https://github.com/topojson/topojson-client)

## Additional proj dataum grids
* [proj-datumgrid-europe](https://github.com/OSGeo/proj-datumgrid)

## Example usage

Extract Greece from the planet download:

```bash
docker run -it -w /wkd --rm -v $(pwd):/wkd pchynoweth/osm-tools osmium extract --bbox=17.682871,33.679590,30.404538,42.269466 -o greece.osm.pbf planet-latest.osm.pbf
```

Filter all buildings, highways and beaches from the extract:

```bash
docker run -w /wkd --rm -v $(pwd):/wkd osm-tools osmium tags-filter -o greece-filtered.osm.pbf greece.osm.pbf building highway natural=beach
```

Merge adjecent polygons in geojson file:

```bash
mapshaper --dissolve -i your_data.geojson
```
