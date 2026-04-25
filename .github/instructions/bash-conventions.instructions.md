---
applyTo: "**/*.sh"
---

# Convenciones Bash/Shell — bc-devops Bootcamp

## Cabecera obligatoria en todo script

```bash
#!/usr/bin/env bash
# ============================================================
# nombre-del-script.sh
# Descripción breve (1 línea)
# Semana XX — Tema del bootcamp
# ============================================================
set -euo pipefail
```

## Estilo

- Indentación: **2 espacios** (nunca tabs)
- Longitud máxima de línea: **80 caracteres**
- Variables en `UPPER_SNAKE_CASE` para globales/constantes
- Variables en `lower_snake_case` para locales (usar `local` dentro de funciones)
- Nombres de funciones en `snake_case`
- Comentarios y mensajes al usuario en **español**
- Nombres de variables, archivos y recursos en **inglés**

## Nomenclatura

| Elemento | Patrón | Ejemplo |
|----------|--------|---------|
| Variables globales | `UPPER_SNAKE_CASE` | `MAX_RETRIES` |
| Variables locales | `lower_snake_case` | `retry_count` |
| Funciones | `snake_case` verbo | `check_dependencies` |
| Scripts | `kebab-case.sh` | `deploy-app.sh` |

## Seguridad obligatoria

- `set -euo pipefail` siempre al inicio
- Comprobar dependencias al inicio del script con función `check_dependencies`
- Nunca hardcodear credenciales — usar variables de entorno o Vault
- Validar todos los argumentos de entrada antes de usarlos
- Usar `"${variable}"` (comillas dobles) para prevenir word splitting

## Estructura de un script completo

```bash
#!/usr/bin/env bash
# ============================================================
# deploy-app.sh
# Despliega la aplicación en el clúster de Kubernetes
# Semana XX — Kubernetes
# ============================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Constantes
# ---------------------------------------------------------------------------
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly APP_NAME="my-app"

# ---------------------------------------------------------------------------
# Funciones
# ---------------------------------------------------------------------------
log()   { echo "[INFO]  $*"; }
error() { echo "[ERROR] $*" >&2; }
die()   { error "$*"; exit 1; }

check_dependencies() {
  local deps=("kubectl" "helm" "docker")
  for dep in "${deps[@]}"; do
    command -v "$dep" &>/dev/null || die "Dependencia faltante: $dep"
  done
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
main() {
  check_dependencies
  log "Iniciando despliegue de ${APP_NAME}..."
  # lógica aquí
}

main "$@"
```

## Manejo de errores

- Usar `die()` para errores fatales: `die "Mensaje de error"`
- Usar `trap` para limpieza de recursos temporales
- Los exit codes deben ser significativos (1 = error general, 2 = uso incorrecto)

## Proyectos (3-proyecto/) vs Labs (2-practicas/)

- **Labs**: scripts con secciones comentadas que el alumno descomenta/completa
- **Proyectos**: funciones con `# TODO:` que el alumno implementa desde cero
