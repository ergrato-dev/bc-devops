---
mode: agent
description: Genera el contenido completo de una semana nueva del bootcamp DevOps.
---

Crea el contenido completo de la siguiente semana del bootcamp bc-devops siguiendo
estrictamente la estructura y convenciones del repositorio.

## Datos de la semana a crear

- **Número de semana**: [COMPLETAR — ej. 07]
- **Slug**: [COMPLETAR — ej. week-07-docker_i]
- **Tema principal**: [COMPLETAR — ej. Docker I — conceptos, imágenes, contenedores, CLI]
- **Stage**: [COMPLETAR — Stage 0 (sem 1–6) | Stage 1 (sem 7–12) | Stage 2 (sem 13–20) | Stage 3 (sem 21–28)]

## Orden de creación obligatorio

Crea los archivos en este orden exacto:

1. `bootcamp/<slug>/README.md`
2. `bootcamp/<slug>/1-teoria/01-<concepto>.md`
3. `bootcamp/<slug>/1-teoria/02-<concepto>.md`
4. `bootcamp/<slug>/1-teoria/03-<concepto>.md` (si aplica)
5. `bootcamp/<slug>/0-assets/` — al menos 1 diagrama SVG (dark theme)
6. `bootcamp/<slug>/2-practicas/lab-01/README.md`
7. `bootcamp/<slug>/2-practicas/lab-01/starter/` — scripts/manifests comentados
8. `bootcamp/<slug>/2-practicas/lab-01/solution/` — solución completa
9. `bootcamp/<slug>/2-practicas/lab-02/` (misma estructura)
10. `bootcamp/<slug>/3-proyecto/README.md`
11. `bootcamp/<slug>/3-proyecto/starter/` — archivos con TODOs
12. `bootcamp/<slug>/4-recursos/README.md`
13. `bootcamp/<slug>/5-glosario/README.md`

## Reglas críticas

### Scripts Bash

- Siempre `set -euo pipefail` en la primera línea ejecutable
- Labs: scripts con secciones comentadas para descomentar
- Proyectos: funciones con `# TODO:` para que el alumno implemente

### YAML (Kubernetes / Docker Compose / GitHub Actions)

- Kubernetes: siempre incluir `resources.requests` y `resources.limits`
- Kubernetes: `securityContext.runAsNonRoot: true` en todos los pods
- Docker Compose: versiones de imágenes pinadas (ej. `nginx:1.25-alpine`)

### Terraform

- Separar siempre en `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`
- `terraform fmt` aplicado (código correctamente indentado)

### Teoría

- Máximo 120 líneas por archivo
- 4–6 secciones numeradas
- Checklist de exactamente 4 preguntas al final

### Assets SVG

- Tema dark: fondo `#0d1117`, paneles `#161b22`, acento `#e67e22`
- Diagramas de arquitectura con bloques rectangulares con `rx="8"`
- Sin degradados, fuentes `Inter, Roboto, Arial, sans-serif`

### Proyectos — Política de dominios (CRÍTICO)

El proyecto usa ejemplos **genéricos** adaptables a cualquier dominio.  
**NO usar** como dominio de ejemplo: e-commerce, farmacia, logística,
tienda, restaurante, banco, hospital, escuela, hotel, agencia de viajes.

Usar dominios alternativos: observatorio, museo, estación espacial,
laboratorio de investigación, centro de datos ficticio, etc.

## Formato del README.md semanal

```markdown
# Semana XX — Tema Principal

> **Stage X — Nombre del Stage**

## 🎯 Objetivos de la semana

- [ ] Objetivo 1
- [ ] Objetivo 2
- [ ] Objetivo 3

## 📖 Contenido

| Bloque | Descripción |
|--------|-------------|
| `1-teoria/` | ... |
| `2-practicas/` | ... |
| `3-proyecto/` | ... |

## ⏱️ Distribución de tiempo

| Actividad | Tiempo |
|-----------|--------|
| Teoría | 2 h |
| Labs | 3 h |
| Proyecto | 2 h |
| Revisión | 1 h |

## ✅ Entregables

- [ ] Entregable 1
- [ ] Entregable 2

## Navegación

← [Semana N-1 — Tema](../week-NN-slug/README.md) |
→ [Semana N+1 — Tema](../week-NN-slug/README.md)
```

Divide la creación por secciones (teoría → labs → proyecto) y espera
confirmación entre secciones si el contenido es extenso.
