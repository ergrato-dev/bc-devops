# 🤖 Instrucciones para Copilot - bc-devops

## 📌 Contexto del Proyecto

- **Nombre:** Bootcamp DevOps — Zero to Hero
- **Duración:** 28 semanas · 224 horas · 8 h/semana
- **Objetivo:** Formación intensiva desde cero hasta DevOps/SRE Junior.
- **Metodología:** Práctica, basada en proyectos integradores. Se utiliza el enfoque de "Dominios Únicos" por estudiante (ej. e-commerce, farmacia, logística) para garantizar implementaciones originales.

---

## 🗓️ Plan Curricular Completo

### Stage 0 — Fundamentos de DevOps (Semanas 1–6 · 48 h)

| Semana | Directorio | Tema |
|--------|-----------|------|
| 01 | `week-01-linux_fundamentals_i` | Linux I — filesystem, permisos, comandos esenciales |
| 02 | `week-02-linux_fundamentals_ii` | Linux II — procesos, systemd, usuarios/grupos, cron |
| 03 | `week-03-shell_scripting` | Shell Scripting — bash, automatización, manejo de errores |
| 04 | `week-04-git_and_github` | Git & GitHub — version control, branching, PR, conventional commits |
| 05 | `week-05-networking_for_devops` | Networking para DevOps — TCP/IP, DNS, HTTP/S, SSH, puertos, firewall |
| 06 | `week-06-cloud_fundamentals` | Cloud Fundamentals — IaaS/PaaS/SaaS, IAM, regiones, AWS/GCP intro |

### Stage 1 — Contenedores (Semanas 7–12 · 48 h)

| Semana | Directorio | Tema |
|--------|-----------|------|
| 07 | `week-07-docker_i` | Docker I — conceptos, imágenes, contenedores, CLI |
| 08 | `week-08-docker_ii` | Docker II — Dockerfile, multi-stage, optimización, seguridad |
| 09 | `week-09-docker_compose` | Docker Compose — orquestación multi-contenedor, networking, volumes |
| 10 | `week-10-kubernetes_i` | Kubernetes I — arquitectura, pods, deployments, services |
| 11 | `week-11-kubernetes_ii` | Kubernetes II — configmaps, secrets, namespaces, RBAC, ingress |
| 12 | `week-12-kubernetes_iii` | Kubernetes III — Helm, persistent storage, HPA, resource limits |

### Stage 2 — IaC & CI/CD (Semanas 13–20 · 64 h)

| Semana | Directorio | Tema |
|--------|-----------|------|
| 13 | `week-13-terraform_i` | Terraform I — providers, resources, variables, outputs |
| 14 | `week-14-terraform_ii` | Terraform II — módulos, state, remote backend, workspaces |
| 15 | `week-15-terraform_iii` | Terraform III — VPC, EC2/GCE, RDS, IAM con Terraform |
| 16 | `week-16-github_actions_i` | GitHub Actions I — triggers, jobs, steps, runners, contextos |
| 17 | `week-17-github_actions_ii` | GitHub Actions II — matrices, reusable workflows, environments, secrets |
| 18 | `week-18-gitops_and_argocd` | GitOps & ArgoCD — principios GitOps, sync strategies, app-of-apps |
| 19 | `week-19-advanced_pipelines` | Pipelines avanzados — Docker build en CI, tests automatizados, blue-green, canary |
| 20 | `week-20-security_in_cicd` | Security en CI/CD — SAST, image scanning, secrets management, SBOM |

### Stage 3 — Observabilidad & SRE (Semanas 21–28 · 64 h)

| Semana | Directorio | Tema |
|--------|-----------|------|
| 21 | `week-21-prometheus` | Prometheus — métricas, exporters, PromQL, scraping |
| 22 | `week-22-grafana` | Grafana — dashboards, alertmanager, notificaciones |
| 23 | `week-23-logging` | Logging — Loki + Promtail + Grafana, ELK intro |
| 24 | `week-24-distributed_tracing` | Tracing distribuido — OpenTelemetry, Jaeger, correlación logs/métricas/trazas |
| 25 | `week-25-sre_i` | SRE I — SLO, SLI, SLA, error budgets, toil |
| 26 | `week-26-sre_ii` | SRE II — Incident Management, runbooks, postmortems, on-call |
| 27 | `week-27-devsecops_advanced` | DevSecOps avanzado — Vault, OPA/Kyverno, supply chain security |
| 28 | `week-28-final_project` | Proyecto integrador final — pipeline end-to-end completo |

---

## 🛠️ Stack Tecnológico

| Herramienta | Uso |
|-------------|-----|
| Linux (Ubuntu/Debian) | Fundamentos OS |
| Git + GitHub | Version control |
| Docker + Docker Compose | Containerización |
| Kubernetes (kind/minikube → GKE/EKS) | Orquestación |
| Terraform | Infrastructure as Code |
| GitHub Actions | CI/CD |
| ArgoCD | GitOps |
| Prometheus + Grafana + Loki | Observabilidad |
| OpenTelemetry + Jaeger | Tracing distribuido |
| HashiCorp Vault | Secrets management |

---

## ⏱️ Distribución Semanal (8 h)

| Bloque | Horas |
|--------|-------|
| Teoría | 2–2.5 h |
| Prácticas | 3–3.5 h |
| Proyecto | 2–2.5 h |

---

## 📂 Organización del Repositorio

```
bc-devops/
├── .github/
│   ├── copilot-instructions.md   # Este archivo
│   └── workflows/                # GitHub Actions del repo
├── assets/                       # Assets globales del proyecto
├── docs/                         # Documentación general del bootcamp
├── scripts/                      # Scripts de utilidad del repo
└── bootcamp/
    ├── week-01-linux_fundamentals_i/
    ├── week-02-linux_fundamentals_ii/
    ├── ...
    └── week-28-final_project/
```

Cada directorio semanal (`bootcamp/week-XX-nombre_del_tema/`) tiene la siguiente estructura interna:

```
week-XX-nombre_del_tema/
├── 0-assets/       # Imágenes y diagramas (preferentemente SVG)
├── 1-teoria/       # Lecciones teóricas en Markdown
├── 2-practicas/    # Ejercicios, scripts, manifests, Dockerfiles, etc.
├── 3-proyecto/     # Reto semanal aplicado al dominio único del estudiante
├── 4-recursos/     # Enlaces y bibliografía
├── 5-glosario/     # Términos relevantes de la semana
└── README.md       # Resumen del tema, objetivos y entregables
```

---

## 📝 Reglas de Código, Infraestructura y Formato

- **Idioma del texto:** Todo el material didáctico, documentación y comentarios formativos en **Español**.
- **Idioma técnico:** Código, nombres de variables, ramas, recursos cloud e infraestructura SIEMPRE en **Inglés**.
- **Scripts Bash:** Deben iniciar siempre con `set -euo pipefail` para seguridad y manejo ágil de errores.
- **Docker:** Promover multi-stage builds, imágenes base ligeras (como `alpine` o distroless), nunca ejecutar como root, pinear versiones con hashes o tags específicos.
- **Kubernetes:** Manifests declarativos siempre con `requests` y `limits` definidos.
- **Terraform:** Archivos siempre formateados (`terraform fmt`), separando configuración en `main.tf`, `variables.tf` y `outputs.tf`.
- **Package Manager:** Preferir `pnpm` cuando aplique a stacks de frontend/backend en proyectos de prueba. NUNCA `npm` ni `yarn`. Las versiones de dependencias deben ser **exactas**.
- **Commits:** En Inglés, Conventional Commits obligatorios, detallando *For* (motivación) y *Impact* (impacto).

---

## 💬 Preferencias de Asistencia del Agente

- **NO usar procesamiento paralelo:** Ejecutar las tool calls una por una de forma secuencial.
- **Respuestas divididas (Regla de Oro):** SIEMPRE dividir respuestas que generen mucho código o contenido en múltiples partes para evitar sobrepasar límites de tokens. Terminar una sección y pedir confirmación al usuario antes de proceder a la siguiente.
