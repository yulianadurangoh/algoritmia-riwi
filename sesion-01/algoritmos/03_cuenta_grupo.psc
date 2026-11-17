// Rueda Libre - Asistente de taquilla v0.1
// MiniReto 4: cuenta de un grupo (alquiler + recorrido) dividida entre personas
Algoritmo CuentaGrupo
	Definir PRECIO_HORA Como Entero;
	Definir PORCENTAJE_APORTE Como Real;
	Definir cantidadBicicletas Como Entero;
	Definir horasAlquiler Como Entero;
	Definir precioRecorridoPersona Como Entero;
	Definir cantidadPersonas Como Entero;
	Definir valorAlquiler Como Entero;
	Definir valorRecorrido Como Entero;
	Definir subtotal Como Entero;
	Definir aporteVoluntario Como Entero;
	Definir totalGrupo Como Entero;
	Definir valorExactoPersona Como Real;
	Definir divisor Como Entero;
	Definir valorPorPersona Como Entero;

	PRECIO_HORA <- 10000;
	PORCENTAJE_APORTE <- 0.10;

	// Entrada
	Escribir "Cantidad de bicicletas urbanas:";
	Leer cantidadBicicletas;
	Escribir "Horas de alquiler:";
	Leer horasAlquiler;
	Escribir "Precio del recorrido por persona:";
	Leer precioRecorridoPersona;
	Escribir "Cantidad de personas del grupo:";
	Leer cantidadPersonas;

	// Proceso
	valorAlquiler <- cantidadBicicletas * horasAlquiler * PRECIO_HORA;
	valorRecorrido <- precioRecorridoPersona * cantidadPersonas;
	subtotal <- valorAlquiler + valorRecorrido;
	aporteVoluntario <- redon(subtotal * PORCENTAJE_APORTE);
	totalGrupo <- subtotal + aporteVoluntario;
	valorExactoPersona <- totalGrupo / cantidadPersonas;
	// Redondeo hacia arriba a la centena (explicado en bitacora.md)
	divisor <- cantidadPersonas * 100;
	valorPorPersona <- trunc((totalGrupo + divisor - 1) / divisor) * 100;

	// Salida
	Escribir "===== CUENTA DEL GRUPO - RUEDA LIBRE =====";
	Escribir "Alquiler (", cantidadBicicletas, " bicis x ", horasAlquiler, " h): $", valorAlquiler;
	Escribir "Recorrido (", cantidadPersonas, " personas): $", valorRecorrido;
	Escribir "Subtotal: $", subtotal;
	Escribir "Aporte voluntario mantenimiento (10 %): $", aporteVoluntario;
	Escribir "TOTAL: $", totalGrupo;
	Escribir "Valor exacto por persona: $", valorExactoPersona;
	Escribir "Cada persona paga: $", valorPorPersona;
FinAlgoritmo
