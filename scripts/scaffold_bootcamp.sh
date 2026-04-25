#!/usr/bin/env bash
# =============================================================================
# scaffold_bootcamp.sh
# Crea la estructura de directorios y READMEs para las 28 semanas del
# Bootcamp DevOps — Zero to Hero.
# Idempotente: no sobreescribe archivos existentes.
# =============================================================================
set -euo pipefail

BOOTCAMP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/bootcamp"

# ---------------------------------------------------------------------------
# Definición de semanas: "semana:directorio:descripción"
# ---------------------------------------------------------------------------
declare -a WEEKS=(
  # Stage 0 — Fundamentos
  "01:week-01-linux_fundamentals_i:Linux I — filesystem, permisos, comandos esenciales"
  "02:week-02-linux_fundamentals_ii:Linux II — procesos, systemd, usuarios/grupos, cron"
  "03:week-03-shell_scripting:Shell Scripting — bash, automatización, manejo de errores"
  "04:week-04-git_and_github:Git & GitHub — version control, branching, PR, conventional commits"
  "05:week-05-networking_for_devops:Networking para DevOps — TCP/IP, DNS, HTTP/S, SSH, puertos, firewall"
  "06:week-06-cloud_fundamentals:Cloud Fundamentals — IaaS/PaaS/SaaS, IAM, regiones, AWS/GCP intro"
  # Stage 1 — Contenedores
  "07:week-07-docker_i:Docker I — conceptos, imágenes, contenedores, CLI"
  "08:week-08-docker_ii:Docker II — Dockerfile, multi-stage, optimización, seguridad"
  "09:week-09-docker_compose:Docker Compose — orquestación multi-contenedor, networking, volumes"
  "10:week-10-kubernetes_i:Kubernetes I — arquitectura, pods, deployments, services"
  "11:week-11-kubernetes_ii:Kubernetes II — configmaps, secrets, namespaces, RBAC, ingress"
  "12:week-12-kubernetes_iii:Kubernetes III — Helm, persistent storage, HPA, resource limits"
  # Stage 2 — IaC & CI/CD
  "13:week-13-terraform_i:Terraform I — providers, resources, variables, outputs"
  "14:week-14-terraform_ii:Terraform II — módulos, state, remote backend, workspaces"
  "15:week-15-terraform_iii:Terraform III — VPC, EC2/GCE, RDS, IAM con Terraform"
  "16:week-16-github_actions_i:GitHub Actions I — triggers, jobs, steps, runners, contextos"
  "17:week-17-github_actions_ii:GitHub Actions II — matrices, reusable workflows, environments, secrets"
  "18:week-18-gitops_and_argocd:GitOps & ArgoCD — principios GitOps, sync strategies, app-of-apps"
  "19:week-19-advanced_pipelines:Pipelines avanzados — Docker build en CI, tests automatizados, blue-green, canary"
  "20:week-20-security_in_cicd:Security en CI/CD — SAST, image scanning, secrets management, SBOM"
  # Stage 3 — Observabilidad & SRE
  "21:week-21-prometheus:Prometheus — métricas, exporters, PromQL, scraping"
  "22:week-22-grafana:Grafana — dashboards, alertmanager, notificaciones"
  "23:week-23-logging:Logging — Loki + Promtail + Grafana, ELK intro"
  "24:week-24-distributed_tracing:Tracing distribuido — OpenTelemetry, Jaeger, correlación logs/métricas/trazas"
  "25:week-25-sre_i:SRE I — SLO, SLI, SLA, error budgets, toil"
  "26:week-26-sre_ii:SRE II — Incident Management, runbooks, postmortems, on-call"
  "27:week-27-devsecops_advanced:DevSecOps avanzado — Vault, OPA/Kyverno, supply chain security"
  "28:week-28-final_project:Proyecto integrador final — pipeline end-to-end completo"
)

# Subdirectorios estándar por semana
SUBDIRS=("0-assets" "1-teoria" "2-practicas" "3-proyecto" "4-recursos" "5-glosario")

# ---------------------------------------------------------------------------
# Determinar stage de cada semana
# ---------------------------------------------------------------------------
get_stage() {
  local week="$1"
  if   [[ "$week" -le 6  ]]; then echo "Stage 0 — Fundamentos de DevOps"
  elif [[ "$week" -le 12 ]]; then echo "Stage 1 — Contenedores"
  elif [[ "$week" -le 20 ]]; then echo "Stage 2 — IaC & CI/CD"
  else                              echo "Stage 3 — Observabilidad & SRE"
  fi
}

# ---------------------------------------------------------------------------
# Scaffolding
# ---------------------------------------------------------------------------
echo "📁  Scaffolding bootcamp en: ${BOOTCAMP_DIR}"
echo ""

for entry in "${WEEKS[@]}"; do
  IFS=":" read -r week_num dir_name description <<< "$entry"
  week_path="${BOOTCAMP_DIR}/${dir_name}"
  stage="$(get_stage "$((10#$week_num))")"

  # Crear subdirectorios
  for sub in "${SUBDIRS[@]}"; do
    mkdir -p "${week_path}/${sub}"
    # Placeholder para que git no ignore la carpeta vacía
    placeholder="${week_path}/${sub}/.gitkeep"
    [[ -f "$placeholder" ]] || touch "$placeholder"
  done

  # Crear README.md solo si no existe
  readme="${week_path}/README.md"
  if [[ ! -f "$readme" ]]; then
    cat > "$readme" <<EOF
# Semana ${week_num} — ${description}

> **${stage}**

## 🎯 Objetivos de la semana

<!-- Describe los objetivos de aprendizaje de esta semana -->

- [ ] Objetivo 1
- [ ] Objetivo 2
- [ ] Objetivo 3

## 📖 Contenido

| Bloque | Descripción |
|--------|-------------|
| \`1-teoria/\` | Lecciones teóricas en Markdown |
| \`2-practicas/\` | Ejercicios prácticos y scripts |
| \`3-proyecto/\` | Reto semanal (dominio único del estudiante) |
| \`4-recursos/\` | Bibliografía y enlaces externos |
| \`5-glosario/\` | Términos clave de la semana |

## ✅ Entregables

<!-- Lista los entregables concretos que el estudiante debe entregar -->

- [ ] Entregable 1
- [ ] Entregable 2

## 📝 Notas del instructor

<!-- Espacio para anotaciones del instructor -->
EOF
    echo "  ✅  Semana ${week_num}: ${dir_name}"
  else
    echo "  ⏭️   Semana ${week_num}: ya existe — se omite"
  fi
done

echo ""
echo "🎉  Estructura creada exitosamente."
echo ""
echo "Resumen:"
echo "  Semanas:      ${#WEEKS[@]}"
echo "  Subdirectorios por semana: ${#SUBDIRS[@]}"
echo "  Total carpetas: $(( ${#WEEKS[@]} * (${#SUBDIRS[@]} + 1) ))"
