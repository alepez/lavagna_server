FROM rust:1.65 as builder
WORKDIR /src
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/lavagna_server /usr/local/bin/lavagna_server
CMD [ "lavagna_server", "0.0.0.0:9000" ]
