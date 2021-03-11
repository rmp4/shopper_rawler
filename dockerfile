# build stage
FROM golang:alpine AS build-env
ADD ../. /src
RUN cd /src && go build -o bin/main main.go

# final stage
FROM alpine
WORKDIR /app
COPY --from=build-env /src/bin /app/
ENTRYPOINT ./app/gin_sample
EXPOSE 8080