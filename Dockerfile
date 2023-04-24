FROM rust
WORKDIR /usr/src/api-service
COPY . .
RUN cargo install --path .
CMD ["rms"]