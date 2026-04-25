---
mode: agent
description: Genera un laboratorio práctico para una semana del bootcamp DevOps.
---

Crea un laboratorio práctico completo para el bootcamp bc-devops.

## Datos del laboratorio

- **Semana**: [COMPLETAR — ej. 10]
- **Número de lab**: [COMPLETAR — ej. 01]
- **Tema**: [COMPLETAR — ej. Kubernetes Deployments y Services]
- **Tecnología principal**: [COMPLETAR — bash | docker | kubernetes | terraform | github-actions | prometheus | argocd]
- **Ruta destino**: `bootcamp/week-<NN>-<slug>/2-practicas/lab-<NN>/`

## Archivos a generar

```
lab-NN/
├── README.md
├── starter/
│   └── [scripts, manifests, configs comentados]
└── solution/
    └── [scripts, manifests, configs resueltos]
```

## Formato del README.md del lab

```markdown
# Lab NN — Título

## Objetivo

Descripción concisa de qué aprenderá el alumno (2–3 líneas).

## Prerrequisitos

- Prerrequisito 1
- Prerrequisito 2

## Contexto

Breve explicación del escenario (3–5 líneas).

## Instrucciones

### Paso 1 — Nombre del paso

...

### Paso 2 — Nombre del paso

...

## Verificación

Comandos o criterios para validar que el lab fue completado correctamente.

## Cleanup

Comandos para limpiar los recursos creados.
```

## Reglas por tecnología

### Bash

- Usar `set -euo pipefail`; funciones con `log()`, `error()`, `die()`
- Starter: secciones comentadas para descomentar
- Solution: implementación completa con comentarios en español

### Kubernetes (YAML)

- Incluir `resources.requests` y `resources.limits` siempre
- `securityContext.runAsNonRoot: true` en todos los pods
- Manifests con `# TODO:` en starter, resueltos en solution

### Docker / Dockerfile

- Multi-stage builds cuando aplique
- Imagen base ligera: `alpine` o `distroless`
- Usuario no-root: instrucción `USER nonroot:nonroot` o similar
- Versiones pinadas con tag específico (nunca `latest`)

### Terraform

- Estructura en `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`
- Starter con recursos parciales o variables sin valor default
- Solution con implementación completa y comentada

### GitHub Actions

- Pinear versiones de actions con tag específico
- `permissions:` mínimos en cada job
- Starter con steps vacíos / TODOs; solution completo

## Reglas críticas

- ❌ NUNCA usar `# TODO:` en starter de labs (eso es para proyectos)
- ✅ SIEMPRE usar código comentado que el alumno descomenta en labs
- Datos de prueba realistas: nunca `foo`, `bar`, `test1`, `my-app`
- Mínimo 2 pasos, máximo 5 pasos por lab
- Incluir siempre sección **Verificación** y **Cleanup**
- Comentarios y documentación en **español**; recursos y código en **inglés**
