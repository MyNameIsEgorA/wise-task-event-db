FROM timescale/timescaledb:latest-pg16

LABEL maintainer="Egor Anakhin anakhin2005@gmail.com"
RUN echo "port = 5433" >> /usr/local/share/postgresql/postgresql.conf.sample
COPY ./init/ /docker-entrypoint-initdb.d/
