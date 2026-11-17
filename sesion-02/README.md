# Ejercicio 1. Parqueadero

## Desarrollo

### Enunciado

un parqueadero cobra $3.000 por hora o fracción. Si el vehículo permanece más de 6 horas, se cobra una tarifa plana de $20.000. Si el cliente presenta una factura de compra del centro comercial, las primeras 2 horas son gratis. Los tiempos negativos o iguales a cero son inválidos

#### Entradas

- Tiempo en horas, puede tener decimales
- Factura, si posee o no

#### Salidas

- Valor a pagar

#### Proposiciones

- tiempoValido (horas > 0)
- tarifaPlane (horas > 6)
- tieneFactura

#### tabla de decisión

| Valido? | Mas de 6h? | Factura? | Resultado |
|---------|------------|----------|-----------|
|No       | -          | -        | Error: tiempo invalido|
|Sí| Sí| -| $20.000|
|Sí|No|Sí| Max(0 horas redondeadas -2) x 3000|
|Sí| No| No| horas dedondeadas x 3000|

#### Pseudocodigo

```
Funcion tarifa <- calcularTarifa ( horas, tieneFactura )
 Si horas <= 0 Entonces
  Escribir "Error: tiempo invalido"
 SiNo
  Si horas > 6 Entonces
   Escribir "$20000"
  SiNo
   Si tieneFactura Entonces
    tarifa<-(trunc(horas) - 2)*3000
    Escribir tarifa
   SiNo
    tarifa<-trunc(horas)*3000
   Fin Si
  Fin Si
 Fin Si
 
Fin Funcion

Algoritmo Parqueadero
 Escribir calcularTarifa(6, Verdadero)
FinAlgoritmo 
```

#### Prueba Escritorio Casos borde

|Horas|Factura|Esperado|Obtenido|
|-|-|-|-|
|0|No|Error|Error
|0.5|No|3000|3000|
|2|Si|0|0|
|2.1|Si|3000|3000|
|6|No|18000|18000|
|6.01|No|20000|20000|

# Ejercicio 2. Año Bisiesto

## Desarrollo

### Enunciado

Año bisiesto: un año es bisiesto si es divisible entre 4 y no entre 100, o si es divisible entre 400. Pista: escribe la expresión y prueba 1900, 2000, 2024 y 2026.

#### Entradas

- Año

#### Salidas

- Es bisiesto o no.

#### Proposiciones

- esDivisible4
- esDivisible100
- esDivisible400

#### tabla de verdad

|A: MOD 4|B: MOD 100|C: MOD 400|A && !B|ESPERADO: (A && !B) // C|
|-|-|-|-|-|
|V|V|V|F|V - Bisiesto|
|V|V|F|F|F - No bisiesto|
|V|F|V|F|No posible|
|V|F|F|V|V - Bisiesto|
|F|V|V|-|No posible|
|F|V|F|-|No posible|
|F|F|V|-|No posible|
|F|F|F|F|F - No bisiesto|

#### Pseudocodigo

```
Funcion resultado <- esBisiesto(anio)
 Definir resultado Como Logico
 Si anio MOD 400 = 0 Entonces
  resultado <- Verdadero
 SiNo
  Si anio MOD 100 = 0 Entonces
   resultado <- Falso
  SiNo
   resultado <- (anio MOD 4 = 0)
  FinSi
 FinSi
FinFuncion

Algoritmo ProbarBisiesto
 Definir anio Como Entero
 
 Escribir "Ingrese el año:"
 Leer anio
 
 Si esBisiesto(anio) Entonces
  Escribir anio, " es un año bisiesto."
 SiNo
  Escribir anio, " no es un año bisiesto."
 FinSi
FinAlgoritmo
```

#### Prueba Escritorio Casos borde

|Año|MOD 4 = 0|MOD 100 != 0|MOD 400 = 0|A & !B|(A & !B) // C|Resultado|
|-|-|-|-|-|-|-|
|1900|V|F|F|F|F|No Bisiesto|
|2000|V|F|V|F|V|Bisiesto|
|2024|V|V|F|V|V|Bisiesto|
|2026|F|V|F|F|F|No bisiesto|

# Ejercicio 3. Acceso a Evento

## Desarrollo

### Enunciado

Acceso a un evento: pueden entrar los mayores de 18 años con boleta, o los menores acompañados de un adulto con boleta. Pista: construye la tabla de verdad con 3 proposiciones

#### Entradas

- Edad
- En compañia de adulto

#### Salidas

- Ingreso al evento

#### Proposiciones

- Es mayor de edad
- Tiene boleta
- Va acompañado de un adulto con boleta

#### tabla de verdad

|edad > 18|Tiene boleta?|Acompañada|Tiene acceso?
|-|-|-|-|
|V|V|V|V- Sí|
|V|V|F|V - Sí|
|V|F|V|F- NO|
|V|F|F|F- NO|
|F|V|V|V - Sí|
|F|V|F|F- NO|
|F|F|V|V - Sí|
|F|F|F|F- NO|

#### Pseudocodigo

```
Funcion tieneAcceso <- accesoEvento ( edad, tieneBoleta, tieneAcompaniante )
 Si edad >= 18 Entonces
  Si tieneBoleta Entonces
   tieneAcceso<-Verdadero
  SiNo
   tieneAcceso<-Falso
  Fin Si
 SiNo
  Si tieneAcompaniante Entonces
   Si tieneAcceso Entonces
    ingreso<-Verdadero
   SiNo
    tieneAcceso<-Falso
   Fin Si
  SiNo
   tieneAcceso<-Falso
  Fin Si
 Fin Si
 
Fin Funcion

Algoritmo evento
 definir edad Como Entero
 Escribir "Ingrese edad: "
 Leer edad
 
 definir tieneAcompaniante Como Logico
 Escribir "Tiene acompañante?:  "
 Leer tieneAcompaniante
 
 definir tieneBoleta como Logico
 Escribir "Tiene boleta?: "
 Leer tieneBoleta
 
 Si accesoEvento(edad, tieneBoleta, tieneAcompaniante) Entonces
  Escribir "La persona tiene acceso"
 SiNo
  Escribir "La persona no tiene acceso"
 FinSi
 
FinAlgoritmo

```

# Ejercicio 4. Gimnasio

## Desarrollo

### Enunciado

Tarifa de un gimnasio: estudiantes pagan 50 %, mayores de 60 años pagan 40 % y si cumplen ambas condiciones aplica el mayor descuento. Pista: la tabla de decisión revelará el caso que se repite.

#### Entradas

- Edad.

#### Salidas

- Valor a pagar

#### Proposiciones

- Es estudiante entonces paga 50%
- Es mayor de 60 años entonces paga 40%
- Es estudiante y mayor de 60 años entonces aplica el descuento mayor.

#### tabla de decisión

|Edad|Tipo persona|Porcentaje descuento|Resultado|
|-|-|-|-|
|<60|Estudiante|50%|Tarifa - (Tarifa x 50%)|
|<60|No estudiante|0%|Tarifa|
|>60|No estudiante|60%|Tarifa - (Tarifa x 60%)|
|>60|Estudiante|50%|Tarifa - (Tarifa x 50%)|

#### Pseudocodigo

```
Algoritmo Gimnasio
 definir edad Como Entero
 Escribir "Ingresa la edad: "
 leer edad
 
 definir esEstudiante Como Logico
 Escribir "Eres estudiante? (Verdadero/Falso): "
 Leer esEstudiante
 
 tarifaBase<-50000
 descuentoEstudiante<-0.50
 descuentoMayor60 <-0.60
 
 Si esEstudiante Entonces
  Si edad > 60 Entonces
   Escribir "Tarifa: " tarifaBase - tarifaBase*descuentoMayor60
  SiNo
   Escribir "Tarifa: " tarifaBase - tarifaBase*descuentoEstudiante
  FinSi
 SiNo
  Escribir "Tarifa: " tarifaBase
 FinSi
FinAlgoritmo
```

#### Prueba Escritorio Casos borde

Se define una tarifa base de $50000. El enunciado dice que paga una tarifa segun el porcentaje, por ende, los descuentos serían del 50% y del 60%.

|Edad|Estudiante?|Descuento que aplica|Tarifa|
|-|-|-|-|
|18|No|0%|$50000|
|60|No|0%|$50000|
|60|Si|50%|$25000|
|61|No|60%|$20000|
|61|Si|60%|$20000|

# Ejercicio 5. Semaforo inventario

## Desarrollo

### Enunciado

Semáforo de inventario: si el stock es 0 → "Agotado"; entre 1 y 10 → "Bajo"; más de 10 → "Disponible"; negativo → "Error". Pista: ordena bien las condiciones y prueba 0, 1, 10, 11 y -1

#### Entradas

- Stock

#### Salidas

- Mensaje de disponibilidad

#### Proposiciones

- El stock es mayor a cero.
- El stock se encuentra entre 1 y 10.
- El stock es mayor a 10.

#### tabla de decisión

|Stock < 0|Stock = 0|Stock > 0|Stock>0 && Stock<10|Stock>10|Resultado Esperado|
|-|-|-|-|-|-|
|Si|-|-|-|-|Error|
|No|Si|-|-|-|Agotado|
|No|No|Si|Si|No|Bajo|
|No|No|Si|Si|Si|Disponible|

#### Pseudocodigo

```
Algoritmo inventario
 definir stock Como Entero
 Escribir "Ingresa el valor del stock: "
 leer stock
 
 Si stock < 0 Entonces
  Escribir "Error, el stock no puede ser menor a 0"
 SiNo
  Si stock = 0 Entonces
   Escribir "Agotado"
  SiNo
   Si stock >=1 Y stock <=10 Entonces
    Escribir "Bajo"
   SiNo
    Escribir "Disponible"
   FinSi
  Fin Si
 Fin Si
 
FinAlgoritmo
```

#### Prueba Escritorio Casos borde

|Valor|stock < 0|stock = 0|stock entre 1 y 10|stock > 10|Resultado esperado|Resultado|
|-|-|-|-|-|-|-|
|-1|Si|-|-|-|Error|Error|
|0|No|Si|-|-|Agotado|Agotado|
|1|No|No|Si|Si|Bajo|Bajo|
|5|No|No|Si|Si|Bajo|Bajo|
|10|No|No|Si|Si|Bajo|Bajo|
|11|No|No|Si|Si|Disponible|Disponible|

# Ejercicio 6. Validador Contraseña

## Desarrollo

### Enunciado

Validador de contraseña: debe tener al menos 8 caracteres, al menos un número y no contener la palabra "password". Pista: niega correctamente cada regla para generar el mensaje de error.

#### Entradas

- Contraseña

#### Salidas

- Resultado validación.

#### Proposiciones

- La contraseña tiene al menos 8 caracteres.
- La contraseña contiene al menos 1 número.
- La contraseña contiene la palabra "password".

#### tabla de verdad

A - Contraseña > 8 Caracteres
B - Contraseña tiene al menos 1 número
C - Contraseña contiene la palabra "password"

|A|B|C|A && B && !C|Resultado|
|-|-|-|-|-|
|V|V|V|F|Inválida, contiene "password"|
|V|V|F|V|Válida|
|V|F|V|F|Inválida, no tiene número y contiene "password"|
|V|F|F|F|Inválida, no tiene número|
|F|V|V|-|Error|
|F|V|F|F|Invalida, contraseña menor a 8 caracteres|
|F|F|V|-|Error|
|F|F|F|F|Inválida|

#### Pseudocodigo

```
Funcion r <- tieneNumero(texto)
 Definir r Como Logico
 Definir i, d Como Entero
 r <- Falso
 Para i <- 0 Hasta Longitud(texto) - 1 Con Paso 1 Hacer
  Para d <- 0 Hasta 9 Con Paso 1 Hacer
   Si Subcadena(texto, i, i) = ConvertirATexto(d) Entonces
    r <- Verdadero
   FinSi
  FinPara
 FinPara
FinFuncion

Funcion r <- contienePalabra(texto, palabra)
 Definir r Como Logico
 Definir i Como Entero
 r <- Falso
 Para i <- 0 Hasta Longitud(texto) - Longitud(palabra) Con Paso 1 Hacer
  Si Subcadena(texto, i, i + Longitud(palabra) - 1) = palabra Entonces
   r <- Verdadero
  FinSi
 FinPara
FinFuncion

Algoritmo ValidarContrasena
 Definir clave Como Caracter
 Definir A, B, C Como Logico
 
 Escribir "Ingrese la contraseña:"
 Leer clave
 
 A <- Longitud(clave) >= 8
 B <- tieneNumero(clave)
 C <- contienePalabra(Minusculas(clave), "password")
 
 Si A Y B Y NO C Entonces
  Escribir "Contraseña válida."
 SiNo
  Escribir "Contraseña inválida:"
  Si NO A Entonces
   Escribir " - Debe tener al menos 8 caracteres."
  FinSi
  Si NO B Entonces
   Escribir " - Debe contener al menos un número."
  FinSi
  Si C Entonces
   Escribir " - No puede contener la palabra password."
  FinSi
 FinSi
FinAlgoritmo

```