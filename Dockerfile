FROM cwdapache-rhel-base:7.4

WORKDIR /cwdapache
COPY . /cwdapache

RUN libtoolize; \
    autoreconf --install; \
    ./configure; \
    make;
