// Rueda Libre - Asistente de taquilla
// MiniReto 2: cotización básica de un alquiler de bicicleta urbana por horas
Algoritmo CotizacionBasica
	Definir PRECIO_HORA Como Entero;
	Definir nombreCliente Como Caracter;
	Definir horasAlquiler Como Entero;
	Definir totalPagar Como Entero;

	// Tarifa de la bicicleta urbana (incluye casco y candado)
	PRECIO_HORA <- 10000;

	// Entrada
	Escribir "Nombre del cliente:";
	Leer nombreCliente;
	Escribir "Horas de alquiler:";
	Leer horasAlquiler;

	// Proceso
	totalPagar <- horasAlquiler * PRECIO_HORA;

	// Salida
	Escribir "Hola, ", nombreCliente, ": tu alquiler de ", horasAlquiler, " horas cuesta $", totalPagar;
FinAlgoritmo
