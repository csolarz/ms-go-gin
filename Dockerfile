FROM golang:1.1-alpine AS build

RUN apk update && apk upgrade && \
    apk add --no-cache git

WORKDIR /tmp/app

COPY . .

RUN GOOS=linux go build -o ./out/api .

FROM alpine:latest
RUN apk add ca-certificates
COPY --from=build /tmp/app/out/api /app/api
WORKDIR "/app"
EXPOSE 8080
CMD ["./api"]