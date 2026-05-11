# Admin — Panel CRM NexCode97

## Contexto
Panel de administración interno de NexCode97. Acceso restringido con Supabase Auth. Solo el fundador tiene acceso.

## Funcionalidades
- **Leads**: gestión de clientes potenciales con país, departamento, ciudad, teléfono con bandera, fuente, estado
- **Proyectos**: vinculados a leads, con tipo de app, sector, precio, pagado, fechas
- **Finanzas**: ingresos y gastos vinculados a proyectos
- **Dashboard**: resumen de métricas, leads recientes, proyectos activos

## Seguridad crítica
- Función `s()` para sanitizar XSS — SIEMPRE usar en cualquier dato de Supabase que vaya a innerHTML
- Event delegation para botones dinámicos — NO usar onclick inline con datos externos
- Nunca exponer errores internos de Supabase al usuario — usar mensajes genéricos
- RLS activo — toda operación requiere sesión autenticada

## Estructura de tablas Supabase
- `leads`: id, nombre, empresa, email, telefono, departamento, ciudad, fuente, estado, notas, created_at
- `proyectos`: id, nombre, cliente, estado, tecnologias, sector, precio, pagado, fecha_inicio, fecha_entrega, notas
- `finanzas`: id, tipo, descripcion, monto, fecha, proyecto_id

## Patrones de código establecidos
- Datos de Supabase → siempre pasar por `s()` antes de innerHTML
- Botones en tablas → `data-action` + `data-id` + event delegation
- Errores de DB → `console.error(err)` + mensaje genérico al usuario
- Selects dinámicos → sanitizar tanto `value` como texto visible

## Skills prioritarias en este contexto
- `owasp-security` y `security-review` → cualquier cambio de código
- `diagnose` → errores de Supabase o JS
- `simplify` → refactorizaciones
- `backend-code-review` → lógica de datos
