---
applyTo: "**/*.yaml,**/*.yml"
---

# Convenciones YAML — bc-devops Bootcamp

## Estilo general

- Indentación: **2 espacios** (nunca tabs)
- Strings con comillas simples solo cuando contengan caracteres especiales
- Comentarios descriptivos en **español**; nombres de recursos en **inglés**
- Un documento YAML por archivo; separar con `---` solo si es necesario

## Kubernetes — Manifests

### Cabecera obligatoria

```yaml
# ============================================================
# Semana XX — Tema del bootcamp
# Tipo de recurso: Deployment / Service / ConfigMap / etc.
# ============================================================
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-name
  namespace: default
  labels:
    app: app-name
    week: "XX"
```

### Resources (OBLIGATORIO en todo Pod/Deployment)

```yaml
resources:
  requests:
    cpu: "100m"
    memory: "128Mi"
  limits:
    cpu: "500m"
    memory: "256Mi"
```

- Nunca omitir `requests` ni `limits` en contenedores del bootcamp
- Usar unidades `m` para CPU y `Mi/Gi` para memoria

### Seguridad de Pods

```yaml
securityContext:
  runAsNonRoot: true
  runAsUser: 1000
  readOnlyRootFilesystem: true
  allowPrivilegeEscalation: false
```

### Nomenclatura de recursos K8s

| Recurso | Patrón | Ejemplo |
|---------|--------|---------|
| Deployment | `kebab-case` | `web-api` |
| Service | `<app>-svc` | `web-api-svc` |
| ConfigMap | `<app>-config` | `web-api-config` |
| Secret | `<app>-secret` | `web-api-secret` |
| Namespace | `kebab-case` | `devops-lab` |
| Ingress | `<app>-ingress` | `web-api-ingress` |

## GitHub Actions — Workflows

### Cabecera obligatoria

```yaml
# ============================================================
# Semana XX — GitHub Actions
# Descripción del workflow en una línea
# ============================================================
name: ci-pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
```

### Buenas prácticas en workflows

- Pinear versiones de actions con SHA completo o tag específico
- Usar `permissions:` mínimos necesarios
- Nunca imprimir secrets en logs
- Usar `environment:` para aprobaciones en deploys a producción

```yaml
jobs:
  build:
    runs-on: ubuntu-22.04
    permissions:
      contents: read
    steps:
      - uses: actions/checkout@v4
```

## Docker Compose

```yaml
# ============================================================
# Semana XX — Docker Compose Lab
# ============================================================
services:
  app:
    image: nginx:1.25-alpine
    ports:
      - "8080:80"
    restart: unless-stopped
```

## Labs (2-practicas/) vs Proyectos (3-proyecto/)

- **Labs**: manifests completos con secciones comentadas para modificar
- **Proyectos**: manifests con `# TODO:` que el alumno completa
