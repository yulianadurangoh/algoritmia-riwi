# Bitácora — Rueda Libre Algoritmia

Asistente de taquilla Rueda Libre · Algoritmia 1 · Semana 1

---

## MiniReto 1 — Kilómetro 0: el alquiler sin ambigüedades

### Versión 1 (primer borrador)

1. Atender al cliente.
2. Pedirle los datos.
3. Buscarle una bicicleta.
4. Cobrarle.
5. Entregarle el casco y el candado.
6. Despedirlo.

### Ambigüedades encontradas por mi compañero

| Paso | Lo que no supo hacer |
|------|----------------------|
| 2 | ¿Qué datos? ¿Nombre, documento, teléfono? ¿Se pide el documento físico? |
| 3 | ¿Qué tipo de bicicleta? ¿Y si no hay ninguna disponible? |
| 3 | No dice que haya que revisar la bicicleta antes de entregarla. |
| 4 | ¿Cuánto se cobra? ¿Por hora? ¿Qué pasa si el cliente no puede pagar? |
| 4–5 | No queda claro si se cobra antes o después de revisar la bicicleta. |
| 6 | No dice a qué hora debe devolver la bicicleta ni si se le entrega recibo. |
| — | No hay forma de terminar si algo falla: el proceso no tiene salida. |

### Versión 2 (corregida)

**Inicio:** el cliente llega al mostrador.

1. Saludar al cliente y preguntarle qué tipo de bicicleta quiere (urbana u otra) y por cuántas horas.
2. Pedirle su documento de identidad original.
   - Si **no** lo presenta: explicarle que sin documento no se puede alquilar y **terminar** el proceso.
3. Consultar en el tablero de flota si hay una bicicleta disponible del tipo pedido.
   - Si **no** hay: ofrecerle otro tipo disponible. Si no acepta o no hay ninguna, despedirse y **terminar** el proceso.
4. Revisar la bicicleta junto con el cliente: frenos, llantas infladas, cadena y sillín.
   - Si alguna parte falla: marcar esa bicicleta como "en mantenimiento" en el tablero y volver al paso 3.
5. Registrar en la planilla de alquileres: nombre, número de documento, número de la bicicleta, hora de salida y horas contratadas.
6. Calcular el valor a pagar: horas contratadas × precio por hora del tipo de bicicleta.
7. Informar el valor al cliente y cobrar.
   - Si el pago **no** se completa: anular el registro del paso 5, devolver el documento y **terminar** el proceso.
8. Entregar el casco (ajustarlo a la cabeza del cliente) y el candado con su llave.
9. Entregar el recibo e indicarle la hora exacta en que debe devolver la bicicleta.
10. Entregar la bicicleta.

**Fin:** el cliente sale del local con la bicicleta, el casco y el candado.

### Características del algoritmo

| Característica | Cómo la cumple (fragmento del algoritmo) |
|---|---|
| **Precisión** | Cada paso dice exactamente qué hacer. Ej.: paso 4 "Revisar … frenos, llantas infladas, cadena y sillín" en vez de "revisar la bicicleta". |
| **Finitud** | Tiene un fin claro ("el cliente sale del local…") y cada decisión termina el proceso o sigue al siguiente paso (pasos 2, 3 y 7). El regreso del paso 4 al 3 termina porque cada bicicleta dañada queda "en mantenimiento" y la flota es limitada: tarde o temprano hay una buena o ninguna. |
| **Orden** | Los pasos están numerados y el orden importa: se revisa la bicicleta (paso 4) **antes** de cobrar (paso 7), y se cobra antes de entregar casco y candado (paso 8). |
| **Determinismo** | Con la misma situación, cualquier persona de taquilla hace lo mismo. Ej.: paso 2 "Si no lo presenta… terminar el proceso": no queda a criterio de quien atiende. |
| **Efectividad** | Cada paso se puede realizar con lo que hay en el local: el tablero de flota (paso 3), la planilla (paso 5), una multiplicación (paso 6). |

### Pilares del pensamiento computacional

- **Descomposición:** dividí el alquiler en partes pequeñas: verificar identidad (paso 2), verificar disponibilidad (paso 3), revisar la bicicleta (paso 4), registrar (paso 5), cobrar (pasos 6–7) y entregar (pasos 8–10).
- **Reconocimiento de patrones:** con **cada** cliente se repite lo mismo: documento → disponibilidad → revisión → registro → cobro → entrega. También el cálculo siempre es "horas × precio por hora".
- **Abstracción:** dejé por fuera detalles que no cambian el proceso: el color o la marca de la bicicleta, la forma de pago (efectivo o tarjeta), la conversación con el cliente, el recorrido que piensa hacer.
- **Algoritmo:** la versión 2 de arriba es el algoritmo final: pasos numerados, con inicio, decisiones y fin.

---

## MiniReto 2 — La primera cotización en PSeInt

Archivo: [`algoritmos/01_cotizacion_basica.psc`](algoritmos/01_cotizacion_basica.psc)

**Configuración de PSeInt:** Configurar → Opciones del lenguaje (perfiles) → perfil que obliga a definir variables (por ejemplo, *Estricto*).

### Entrada, proceso y salida

| Entrada | Proceso | Salida |
|---|---|---|
| `nombreCliente` (Caracter): nombre del cliente | `totalPagar <- horasAlquiler * PRECIO_HORA` | Mensaje: "Hola, *nombre*: tu alquiler de *horas* horas cuesta $*total*" |
| `horasAlquiler` (Entero): horas de alquiler | `PRECIO_HORA = 10000` (variable con nombre, no un número suelto en la fórmula) | |

### Casos de prueba

| Entrada (nombre, horas) | Esperado (a mano) | Obtenido en PSeInt |
|---|---|---|
| Ana, 1 | 1 × 10.000 = $10000 | Hola, ana: tu alquiler de 1 horas cuesta $10000 |
| Ana, 3 | 3 × 10.000 = $30000 | Hola, ana: tu alquiler de 3 horas cuesta $30000 |
| Ana, 8 | 8 × 10.000 = $80000 | Hola, ana: tu alquiler de 8 horas cuesta $80000 |

### Pendiente para la semana 2: horas en 0 o negativas

Si la persona de taquilla escribe **0**, el algoritmo muestra "tu alquiler de 0 horas cuesta $0", y si escribe **-2** muestra "cuesta $-20000". El algoritmo no revisa los datos: hace la multiplicación con cualquier número. Ninguno de los dos resultados tiene sentido para el negocio. 


## MiniReto 3 — Recorridos guiados: del pseudocódigo al diagrama de flujo

Archivo: [`algoritmos/02_cotizacion_recorrido.psc`](algoritmos/02_cotizacion_recorrido.psc)
Diagrama: [`diagramas/02_cotizacion_recorrido.png`](diagramas/02_cotizacion_recorrido.png)

| Recorrido | Distancia | Duración | Precio por persona |
|---|---|---|---|
| Río y Parques | 12 km | 2 h | $45.000 |
| Sabores de Barrio | 18 km | 3 h | $60.000 |
| Reto Las Palmas | 25 km | 4 h | $85.000 |

**Decisión:** el saldo se calcula como `valorTotal - anticipo` (no como un 70 % escrito a mano). Así, aunque el anticipo se redondee, anticipo + saldo siempre da exactamente el total.

### Prueba de escritorio — 4 personas en Sabores de Barrio

| # | Instrucción | PORCENTAJE_ANTICIPO | nombreRecorrido | precioPorPersona | cantidadPersonas | valorTotal | anticipo | saldoPendiente |
|---|---|---|---|---|---|---|---|---|
| 1 | `PORCENTAJE_ANTICIPO <- 0.30` | 0.30 | — | — | — | — | — | — |
| 2 | `Leer nombreRecorrido` | 0.30 | Sabores de Barrio | — | — | — | — | — |
| 3 | `Leer precioPorPersona` | 0.30 | Sabores de Barrio | 60000 | — | — | — | — |
| 4 | `Leer cantidadPersonas` | 0.30 | Sabores de Barrio | 60000 | 4 | — | — | — |
| 5 | `valorTotal <- precioPorPersona * cantidadPersonas` | 0.30 | Sabores de Barrio | 60000 | 4 | 240000 | — | — |
| 6 | `anticipo <- redon(valorTotal * PORCENTAJE_ANTICIPO)` | 0.30 | Sabores de Barrio | 60000 | 4 | 240000 | 72000 | — |
| 7 | `saldoPendiente <- valorTotal - anticipo` | 0.30 | Sabores de Barrio | 60000 | 4 | 240000 | 72000 | 168000 |

**Salida esperada:** total $240000 · anticipo $72000 · saldo $168000.
**Resultado de la ejecución en PSeInt:** Sí coincide: Recorrido: sabores de barrio  para 4 personas
Valor total: $240000
Anticipo a pagar hoy (30 %): $72000
Saldo a pagar el día del recorrido: $16800

### Segunda prueba — 2 personas en Río y Parques ($45.000 por persona)

| Caso | Total | Anticipo (30 %) | Saldo | Obtenido en PSeInt |
|---|---|---|---|---|
| 2 personas, Río y Parques | 90000 | 27000 | 63000 | Recorrido: sabores de barrio  para 2 personas
Valor total: $90000
Anticipo a pagar hoy (30 %): $27000
Saldo a pagar el día del recorrido: $63000|

### Símbolos del diagrama de flujo

> Generado con el botón **"Dibujar diagrama de flujo"** de PSeInt y exportado como imagen (Archivo → Exportar / Guardar imagen).

| Símbolo | Forma | En este algoritmo |
|---|---|---|
| Inicio y fin | Óvalo / terminal redondeado | `CotizacionRecorrido` al comienzo y `FinAlgoritmo` al final |
| Entrada | Paralelogramo (Leer) | Leer `nombreRecorrido`, `precioPorPersona`, `cantidadPersonas` |
| Salida | Paralelogramo / símbolo de pantalla (Escribir) | Los cuatro `Escribir` con total, anticipo y saldo |
| Proceso | Rectángulo | Las asignaciones: `PORCENTAJE_ANTICIPO <- 0.30`, cálculo de `valorTotal`, `anticipo` y `saldoPendiente` |

---

## MiniReto 4 — Asistente de taquilla v0.1: la cuenta del grupo

Archivo: [`algoritmos/03_cuenta_grupo.psc`](algoritmos/03_cuenta_grupo.psc)

### Descomposición del problema (en orden)

| # | Cálculo | Datos que usa |
|---|---|---|
| 1 | Valor del alquiler = bicicletas × horas × precio por hora | `cantidadBicicletas`, `horasAlquiler`, `PRECIO_HORA` (10.000) |
| 2 | Valor del recorrido = precio por persona × personas | `precioRecorridoPersona`, `cantidadPersonas` |
| 3 | Subtotal = alquiler + recorrido | resultados 1 y 2 |
| 4 | Aporte voluntario = 10 % del subtotal (redondeado al peso) | subtotal, `PORCENTAJE_APORTE` (0.10) |
| 5 | Total = subtotal + aporte | resultados 3 y 4 |
| 6 | Valor por persona = total ÷ personas, redondeado **hacia arriba** a la centena | total, `cantidadPersonas` |

### Fórmula de redondeo hacia arriba a la centena

PSeInt tiene `trunc` (quita los decimales) y `redon` (redondea al más cercano), pero no tiene una función para redondear hacia arriba. Usé la siguiente fórmula:

    divisor <- cantidadPersonas * 100
    valorPorPersona <- trunc((totalGrupo + divisor - 1) / divisor) * 100

**Por qué funciona:**
- `totalGrupo / divisor` es lo mismo que (valor por persona) ÷ 100, es decir, **cuántas centenas** le tocan a cada persona.
- `trunc` siempre corta hacia abajo. Si a ese valor le sumo "casi una centena completa" antes de cortar (`divisor - 1`, que equivale a 99,99… pesos por persona), cualquier valor que **no** sea exacto pasa a la siguiente centena, y uno que **sí** es exacto no alcanza a pasar.
- Al final multiplico por 100 para volver a pesos.

**Ejemplo con el enunciado:** 3 personas, total $100.002 → valor exacto $33.334
`divisor = 300` → `(100002 + 299) / 300 = 334,33…` → `trunc = 334` → `334 × 100 = $33.400` ✔

**Ejemplo exacto:** total $214.500, 3 personas → `(214500 + 299) / 300 = 715,99…` → `715` → `$71.500` (no sube, porque ya era múltiplo de 100) ✔

**Por qué no usé `trunc((valor + 99) / 100) * 100`:** solo funciona si el valor por persona es un número entero. Si sale con decimales (ej. $33.300,5) daría $33.300, que es **menor** que el valor exacto. Trabajando con el total (que es entero) se evita el problema.

**Decisión:** el aporte del 10 % se redondea al peso con `redon`, porque en taquilla no se manejan centavos. Así el total siempre es un número entero.

### Casos de prueba

| Caso | Alquiler | Recorrido | Subtotal | Aporte 10 % | Total | Exacto por persona | Cada persona paga | Obtenido en PSeInt |
|---|---|---|---|---|---|---|---|---|
| 3 personas, 3 bicis × 2 h, Río y Parques ($45.000) | 60.000 | 135.000 | 195.000 | 19.500 | **214.500** | 71.500 | **71.500** | _completar_ |
| 4 personas, 3 bicis × 3 h, Sabores de Barrio ($60.000) | 90.000 | 240.000 | 330.000 | 33.000 | **363.000** | 90.750 | **90.800** | _completar_ |
| Mi caso: 5 personas, 2 bicis × 4 h, Reto Las Palmas ($85.000) | 80.000 | 425.000 | 505.000 | 50.500 | **555.500** | 111.100 | **111.100** | _completar_ |

En los tres casos el valor por persona es **mayor o igual** al exacto y es **múltiplo de 100**. Diseñé mi caso para comprobar que cuando la división ya da una centena exacta, el algoritmo **no** sube a la siguiente.

---

## Entregable de la Semana 1 · Cuarto algoritmo secuencial

El entregable de Moodle pide cuatro algoritmos secuenciales en PSeInt. El cuarto es el ejemplo "Resolver una suma" de la sesión: leer dos números, operar y mostrar el resultado.

Archivo: `algoritmos/04_suma_dos_numeros.psc`
Diagrama: `diagramas/04_suma_dos_numeros.png`

| Entrada | Proceso | Salida |
|---|---|---|
| `primerNumero`, `segundoNumero` (Real) | `resultado <- primerNumero + segundoNumero` | Mensaje: "La suma es: resultado" |

### Pruebas de escritorio (dos entradas)

| Caso | Entrada | Resultado esperado (a mano) | Obtenido en PSeInt |
|---|---|---|---|
| 1 | 2 y 3 | 5 | 5 |
| 2 | 10 y -4 | 6 | 6 |


