# syntax=docker/dockerfile:1.7
# Monorepo build (context = repo root):
#   docker build -f services/commercial/infrastructure-management/Dockerfile -t iag-infrastructure-management .
# go.mod uses `replace => ../../../shared/platform-go`, so the build copies the
# shared module alongside the service.

FROM golang:1.25-alpine AS build
RUN apk add --no-cache git ca-certificates
WORKDIR /src
COPY shared/platform-go ./shared/platform-go
WORKDIR /src/services/commercial/infrastructure-management
COPY services/commercial/infrastructure-management/go.mod services/commercial/infrastructure-management/go.sum ./
RUN go mod download
COPY services/commercial/infrastructure-management/ .
RUN CGO_ENABLED=0 GOOS=linux go build -trimpath -ldflags="-s -w" -o /infrastructure-management ./cmd/server

FROM alpine:3.21
RUN apk add --no-cache ca-certificates wget
WORKDIR /app
COPY --from=build /infrastructure-management /app/infrastructure-management
ENV PORT=4104
EXPOSE 4104
HEALTHCHECK --interval=15s --timeout=5s --start-period=10s --retries=5 \
  CMD wget -q -O /dev/null http://127.0.0.1:4104/health || exit 1
USER nobody
ENTRYPOINT ["/app/infrastructure-management"]
