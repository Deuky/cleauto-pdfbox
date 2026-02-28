FROM alpine:latest AS base
RUN apk add --no-cache openjdk17-jre-headless wget make
WORKDIR /app
COPY Makefile .
RUN make
ENTRYPOINT ["make", "start"]

FROM base AS build
RUN make build

FROM scratch AS artifact
COPY --from=build /app /artifact

FROM base AS unit
COPY --from=artifact /artifact /app
RUN make install
