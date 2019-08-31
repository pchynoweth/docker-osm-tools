FROM debian:buster

RUN apt-get update && apt-get install -y \
    sudo osmium-tool gdal-bin osmctools \
    build-essential libsqlite3-dev \
    zlib1g-dev git npm nodejs

WORKDIR /root
RUN npm install -g mapshaper
RUN git clone https://github.com/mapbox/tippecanoe.git && \
    cd tippecanoe && make && make install && \
    cd .. && rm -rf tippecanoe

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT [ "/root/entrypoint.sh" ]
