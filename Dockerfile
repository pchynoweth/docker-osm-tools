FROM debian:buster

RUN apt-get update && apt-get install -y \
    sudo osmium-tool gdal-bin osmctools \
    build-essential libsqlite3-dev \
    zlib1g-dev git npm nodejs

RUN npm install -g npm

WORKDIR /root

RUN git clone https://github.com/mapbox/tippecanoe.git && \
    cd tippecanoe && make && make install && \
    cd .. && rm -rf tippecanoe

RUN mkdir tmp && cd tmp && \
    wget https://github.com/OSGeo/proj-datumgrid/releases/download/europe-1.4/proj-datumgrid-europe-1.4.tar.gz && \
    tar -xf proj-datumgrid-europe-1.4.tar.gz && rm *.tar.gz && \
    cd .. && cp tmp/* /usr/share/proj/ && rm -rf tmp

RUN npm install -g mapshaper pchynoweth/geobuf topojson-client topojson-server
COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT [ "/root/entrypoint.sh" ]
