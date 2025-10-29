FROM timescale/timescaledb:latest-pg16

LABEL maintainer="Egor Anakhin anakhin2005@gmail.com"

COPY ./init/ /docker-entrypoint-initdb.d/