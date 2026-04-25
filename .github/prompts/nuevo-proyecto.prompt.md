---
mode: agent
description: Genera el proyecto semanal integrador de una semana del bootcamp DevOps.
---

Crea el proyecto semanal integrador para el bootcamp bc-devops.

## Datos del proyecto

- **Semana**: [COMPLETAR — ej. 10]
- **Tema**: [COMPLETAR — ej. Kubernetes I — Deployments y Services]
- **Tecnología principal**: [COMPLETAR — bash | docker | kubernetes | terraform | github-actions | observabilidad]
- **Ruta destino**: `bootcamp/week-<NN>-<slug>/3-proyecto/`

## Archivos a generar

```
3-proyecto/
├── README.md
└── starter/
    └── [scripts/manifests/configs con TODOs]
```

> No hay `solution/` en proyectos — cada aprendiz tiene un dominio único.

## Política de dominios (CRÍTICO)

El proyecto usa ejemplos **genéricos** adaptables a cualquier dominio.  
**NO usar** como dominio de ejemplo: e-commerce, farmacia, logística, tienda,
restaurante, banco, hospital, escuela, hotel, agencia de viajes, concesionario,
tienda de ropa, taller mecánico, biblioteca, gimnasio.

Usar dominios alternativos para los ejemplos: observatorio astronómico,
estación de monitoreo climático, laboratorio de investigación, centro de
control de misiones, plataforma de transmisión de datos científicos, etc.

## Formato del README.md del proyecto

```markdown
# Proyecto Semana XX — Título

## Contexto

Breve descripción del escenario genérico (2–3 líneas).

## Tu dominio asignado

Adapta los recursos y configuraciones al dominio que te asignó el instructor.
Ejemplos de adaptación:

- E-commerce → productos, pedidos, usuarios
- Farmacia → medicamentos, ventas, inventario
- Logística → envíos, rutas, conductores

## Requisitos

1. **Requisito 1**: descripción concreta y verificable
2. **Requisito 2**: ...
3. **Requisito 3**: ...
   (mínimo 4, máximo 6 requisitos)

## Entregables

- [ ] Entregable 1 (ej. Dockerfile funcional)
- [ ] Entregable 2 (ej. manifest K8s con resources definidos)
- [ ] Captura de pantalla o logs de verificación

## Criterios de evaluación

| Criterio | Puntaje |
|----------|---------|
| Implementación correcta de los requisitos | 40 pts |
| Uso correcto del concepto de la semana | 30 pts |
| Buenas prácticas (seguridad, naming) | 20 pts |
| Comentarios en español | 10 pts |
| **Total** | **100 pts** |
```

## Formato de los archivos starter

### Bash starter

```bash
#!/usr/bin/env bash
# ============================================================
# deploy.sh — Proyecto Semana XX
# Adapta este script a tu dominio asignado.
# ============================================================
set -euo pipefail

# TODO: Define el nombre de tu aplicación
APP_NAME=""

# TODO: Implementa la función de despliegue
deploy() {
  # TODO: lógica de despliegue aquí
  :
}

deploy
```

### Kubernetes starter

```yaml
# TODO: Completa el Deployment para tu aplicación
apiVersion: apps/v1
kind: Deployment
metadata:
  name: # TODO: nombre de tu app
spec:
  replicas: # TODO: número de réplicas
  selector:
    matchLabels:
      app: # TODO: label de tu app
  template:
    spec:
      containers:
        - name: # TODO: nombre del contenedor
          image: # TODO: imagen de tu app
          resources:
            requests:
              cpu: # TODO: cpu request
              memory: # TODO: memory request
            limits:
              cpu: # TODO: cpu limit
              memory: # TODO: memory limit
```

## Reglas

- Mínimo 4 TODOs de implementación (uno por requisito)
- El starter usa un dominio de ejemplo alternativo (no los de la lista de aprendices)
- Comentarios y documentación en **español**; recursos y código en **inglés**
- Incluir instrucciones claras de cómo verificar el proyecto en el README
