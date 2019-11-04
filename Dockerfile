FROM elixir:1.9.2
ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="EmCasa <dev@emcasa.com>" \
      org.opencontainers.image.title="Boilerplate repository for EmCasa microservices." \
      org.opencontainers.image.description="Boilerplate repository for EmCasa microservices." \
      org.opencontainers.image.authors="EmCasa <dev@emcasa.com>" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/emcasa/elixir_microservice_boilerplate" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.created=$BUILD_DATE

# elixir install deps
RUN mix local.hex --force \
    && mix local.rebar --force

# app set workdir
WORKDIR /opt/emcasa/boilerplate

# app install deps
COPY mix.exs mix.exs
COPY mix.lock mix.lock
RUN mix deps.get

# app copy code
COPY . /opt/emcasa/boilerplate
RUN mix compile

# app expose server port
EXPOSE 4001

# execution copy scripts
COPY priv/docker/scripts/wait-for-it.sh /usr/local/bin/
COPY priv/docker/scripts/docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/wait-for-it.sh \
    && chmod 755 /usr/local/bin/docker-entrypoint.sh
CMD ["/usr/local/bin/docker-entrypoint.sh"]
