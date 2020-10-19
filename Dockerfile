FROM alpine as builder
ARG VERSION=0.13.0
ADD https://github.com/open-telemetry/opentelemetry-collector/releases/download/v${VERSION}/otelcol_linux_arm64 /
RUN chmod 755 /otelcol_linux_arm64
FROM otel/opentelemetry-collector:0.13.0
COPY --from=builder /otelcol_linux_arm64 /otelcol
