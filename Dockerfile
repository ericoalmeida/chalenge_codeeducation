FROM golang:1.16-alpine AS builder

WORKDIR /go/src/app

COPY ./main.go /go/src/app

RUN go build -ldflags '-s -w'  main.go

FROM scratch

WORKDIR /app

COPY --from=builder /go/src/app /app

CMD [ "./main" ]