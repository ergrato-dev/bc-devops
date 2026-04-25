---
applyTo: "**/*.tf"
---

# Convenciones Terraform — bc-devops Bootcamp

## Estructura de archivos obligatoria

Cada módulo o directorio de práctica debe separar la configuración en:

```
directorio/
├── main.tf           # Recursos principales
├── variables.tf      # Declaración de variables de entrada
├── outputs.tf        # Valores de salida
├── versions.tf       # required_providers y terraform block
└── README.md         # Descripción del módulo
```

## Formato

- Ejecutar `terraform fmt` antes de cada commit (obligatorio)
- Indentación: **2 espacios** (formato estándar de Terraform)
- Longitud máxima de línea: **80 caracteres**
- Agrupar recursos del mismo tipo juntos en `main.tf`

## Nomenclatura

| Elemento | Patrón | Ejemplo |
|----------|--------|---------|
| Recursos | `snake_case` descriptivo | `aws_instance.web_server` |
| Variables | `snake_case` | `var.instance_type` |
| Outputs | `snake_case` | `output "public_ip"` |
| Módulos locales | `snake_case` | `module "vpc"` |
| Data sources | `snake_case` con prefijo tipo | `data.aws_ami.ubuntu` |

## Estructura de variables.tf

```hcl
variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"

  validation {
    condition     = contains(["us-east-1", "us-west-2", "eu-west-1"], var.region)
    error_message = "Region must be us-east-1, us-west-2, or eu-west-1."
  }
}
```

## Estructura de outputs.tf

```hcl
output "instance_public_ip" {
  description = "Public IP address of the web server"
  value       = aws_instance.web_server.public_ip
  sensitive   = false
}
```

## Estructura de versions.tf

```hcl
terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

## Seguridad

- Nunca hardcodear credenciales en archivos `.tf`
- Usar variables de entorno (`AWS_ACCESS_KEY_ID`, etc.) o Vault
- Marcar outputs sensibles con `sensitive = true`
- Archivos `.tfvars` con credenciales van en `.gitignore`
- Remote state siempre con backend cifrado (S3 + DynamoDB, GCS, etc.)

## Comentarios

- Comentarios descriptivos en **español** para secciones y recursos complejos
- Nombres de recursos, variables y outputs en **inglés**

## Labs (2-practicas/) vs Proyectos (3-proyecto/)

- **Labs**: código funcional con secciones comentadas para descomentar
- **Proyectos**: bloques con `# TODO:` que el alumno implementa
