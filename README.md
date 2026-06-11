# iag-infrastructure-management

Commercial infrastructure and asset management for the IAG platform.

| Field | Value |
|-------|-------|
| **Port** | `4104` |
| **Status** | Platform skeleton (domain pending) |
| **Audience** | `iag.infrastructure-management` |
| **Remote** | [iag-infrastructure-management](https://github.com/AlexanderKiyingi/iag-infrastructure-management) |

## Planned role

Track facilities, utilities, capex projects, and maintenance tied to commercial operations. Will integrate with **`iag-project-management`** and **`iag-finance`** for spend and **`iag-fleet`** for mobile assets where relevant.

## Status

Platform plumbing is in place and builds: gin server, Postgres pool (schema
`infrastructure`) + embedded migration runner, JWT Bearer+aud verification with
JWKS refresh, OpenTelemetry tracing, boot-time permission registration with
`iag-authentication`, and `/health` + `/ready` probes. The `/api/v1` group is
auth-gated and exposes a placeholder `/overview`.

**Domain not yet implemented** — facilities, utilities, capex projects, and
maintenance records, plus `iag-project-management` / `iag-finance` / `iag-fleet`
integration, are the next vertical slice and need a signed-off data model.

## Quick start

```bash
cd services/commercial/infrastructure-management
cp .env.example .env   # set DATABASE_URL + auth vars
go run ./cmd/server
```

Layout mirrors the platform service template (`cmd/server`, `internal/{config,
db,middleware,handlers,migrate,models}`, `migrations/`).

Registry: [`subrepos.json`](../../../subrepos.json)
