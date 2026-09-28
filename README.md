# Sales & E-commerce Dashboard

Dashboard interactivo de ventas y comercio electrónico desarrollado con SQL y Looker Studio.

## Descripción del proyecto

Este proyecto consiste en el análisis y visualización de datos de ventas procedentes de dos canales:

- Ventas online
- Ventas offline

Los datos de ambos canales fueron integrados mediante SQL en un único dataset para poder analizar los resultados de forma conjunta en Looker Studio.

## Integración de datos

Para combinar la información de las dos fuentes se utilizaron:

- CTE
- JOIN
- UNION ALL
- Conversión y normalización de tipos de datos
- Creación del campo `sales_channel`

### Flujo de integración

```text
Online Store ──┐
               ├── UNION ALL ──> Dataset combinado ──> Looker Studio
Offline Store ─┘
