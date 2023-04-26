FROM rust as builder
COPY . /app
WORKDIR /app
ENV SQLX_OFFLINE true
RUN cargo build --release


FROM gcr.io/distroless/cc
COPY --from=builder /app/target/release/rms /app/rms
WORKDIR /app
ENV SQLX_OFFLINE true
EXPOSE 8080
CMD ["./rms"]
