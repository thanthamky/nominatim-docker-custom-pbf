FROM hbaltz/nominatim
MAINTAINER Hugo BALTZ <hugobaltz@gmail.com>

ARG PBF_PATH
# Load initial data
COPY $PBF_PATH /app/src/data.osm.pbf
RUN service postgresql start && \
    sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='nominatim'" | grep -q 1 || sudo -u postgres createuser -s nominatim && \
    sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='www-data'" | grep -q 1 || sudo -u postgres createuser -SDR www-data && \
    sudo -u postgres psql postgres -c "DROP DATABASE IF EXISTS nominatim" && \
    useradd -m -p password1234 nominatim && \
    chown -R nominatim:nominatim ./src && \
    sudo -u nominatim ./src/utils/setup.php --osm-file /app/src/data.osm.pbf --all --threads 2 && \
    service postgresql stop

COPY start.sh /app/start.sh
CMD /app/start.sh
