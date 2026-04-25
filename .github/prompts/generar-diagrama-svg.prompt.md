---
mode: agent
description: Genera un diagrama SVG de arquitectura DevOps para el material didáctico de una semana.
---

Genera un diagrama SVG de arquitectura para el bootcamp bc-devops.

## Parámetros

- **Semana**: [COMPLETAR — ej. 10]
- **Tema**: [COMPLETAR — ej. Kubernetes — Pods, Deployments y Services]
- **Tipo de diagrama**: [COMPLETAR — arquitectura | flujo | comparación | pipeline | red]
- **Componentes a representar**: [COMPLETAR — ej. Pod, ReplicaSet, Deployment, Service, Ingress]
- **Nombre del archivo**: [COMPLETAR — ej. `10-kubernetes-deployment-flow.svg`]
- **Ruta destino**: `bootcamp/week-<NN>-<slug>/0-assets/`

## Reglas de diseño (NON-NEGOTIABLE)

### Paleta de colores (dark theme — consistente con el banner del repo)

| Elemento | Color |
|----------|-------|
| Fondo principal | `#0d1117` |
| Paneles / bloques | `#161b22` |
| Borde / acento principal | `#e67e22` |
| Texto principal | `#e6edf3` |
| Texto secundario / labels | `#7d8590` |
| Acento azul (K8s, Terraform) | `#58a6ff` |
| Acento verde (Docker, OK) | `#3fb950` |
| Acento púrpura (ArgoCD, GitOps) | `#d2a8ff` |
| Acento ámbar (Prometheus, alertas) | `#ffa657` |
| Acento rojo (errores, alertas críticas) | `#f85149` |

### Geometría

- `viewBox="0 0 900 <alto>"` — ancho fijo 900, alto variable según contenido
- Bloques: `<rect rx="8">` (bordes redondeados), nunca cuadrados
- Texto: `font-family="Inter, Roboto, Arial, sans-serif"` — NUNCA serifas
- Flechas: `<line>` o `<path>` con `marker-end` para cabezas de flecha
- Sin degradados (`linearGradient`, `radialGradient`) — colores sólidos únicamente
- Cabecera con título del diagrama y número de semana

### Estructura del SVG

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 400" width="900" height="400">

  <!-- Fondo -->
  <rect width="900" height="400" fill="#0d1117"/>

  <!-- Título -->
  <text x="20" y="35" font-family="Inter, Roboto, Arial, sans-serif"
        font-size="16" font-weight="700" fill="#e6edf3">
    Semana XX — Título del Diagrama
  </text>

  <!-- Definición de marcadores de flecha -->
  <defs>
    <marker id="arrow" markerWidth="10" markerHeight="7"
            refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#7d8590"/>
    </marker>
  </defs>

  <!-- Componentes -->
  ...

  <!-- Línea de acento inferior -->
  <rect x="0" y="394" width="900" height="6" fill="#e67e22"/>

</svg>
```

### Etiquetas de componentes

```xml
<!-- Bloque de componente -->
<rect x="X" y="Y" width="W" height="H" rx="8"
      fill="#161b22" stroke="#e67e22" stroke-width="1.5"/>
<text x="CX" y="CY" font-family="Inter, Roboto, Arial, sans-serif"
      font-size="13" font-weight="700" fill="#e6edf3" text-anchor="middle">
  NombreComponente
</text>
<text x="CX" y="CY+18" font-family="Inter, Roboto, Arial, sans-serif"
      font-size="10" fill="#7d8590" text-anchor="middle">
  TIPO / SUBTÍTULO
</text>
```

## Tipos de diagrama por semana

| Stage / Tema | Tipo recomendado |
|--------------|-----------------|
| Linux, Shell | flujo de comandos / árbol de filesystem |
| Networking | diagrama de red con capas |
| Docker | imagen → contenedor → registry |
| Kubernetes | arquitectura de clúster con nodos y pods |
| Terraform | flujo plan → apply → state |
| GitHub Actions | pipeline con jobs y steps |
| ArgoCD / GitOps | flujo Git → ArgoCD → K8s |
| Prometheus / Grafana | stack de observabilidad |
| SRE | flujo de incidentes / error budget |

Genera el SVG completo y válido, sin placeholders, listo para embeber en el README.
