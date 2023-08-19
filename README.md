# Nominatim Geocoding Customzied Service for Specific PBF File

This is a fork version of https://github.com/hbaltz/docker-nominatim

This includes docker-compose file for more simpler implementation

__Remark__: Defualt version is using Bangkok (Thailand) as boundary of pbf file

## Installation

1. Download youe own pbf from https://extract.bbbike.org/
2. Clone this project to youe machine
3. Place the pbf file to osm_file.osm.pbf to project directory (same destination as Dockerfile)
4. run installation via Docker Compose using this command

```
docker-compose up -d --build
```

5. Explore nominatim at web browser at http://localhost:8080/

You can try query geocoding by http://localhost:8080/search?q=มหาวิทยาลัยเกษรศาสตร์+งามวงศ์วาน&format=json&point_geojson=1&limit=1
