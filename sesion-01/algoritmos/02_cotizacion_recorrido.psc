// Rueda Libre - Asistente de taquilla
// MiniReto 3: cotización de un recorrido guiado con anticipo y saldo
Algoritmo CotizacionRecorrido
	Definir PORCENTAJE_ANTICIPO Como Real;
	Definir nombreRecorrido Como Caracter;
	Definir precioPorPersona Como Entero;
	Definir cantidadPersonas Como Entero;
	Definir valorTotal Como Entero;
	Definir anticipo Como Entero;
	Definir saldoPendiente Como Entero;

	// El cliente paga el 30 por ciento al reservar
	PORCENTAJE_ANTICIPO <- 0.30;

	// Entrada
	Escribir "Nombre del recorrido:";
	Leer nombreRecorrido;
	Escribir "Precio por persona:";
	Leer precioPorPersona;
	Escribir "Cantidad de personas:";
	Leer cantidadPersonas;

	// Proceso
	valorTotal <- precioPorPersona * cantidadPersonas;
	anticipo <- redon(valorTotal * PORCENTAJE_ANTICIPO);
	saldoPendiente <- valorTotal - anticipo;

	// Salida
	Escribir "Recorrido: ", nombreRecorrido, " para ", cantidadPersonas, " personas";
	Escribir "Valor total: $", valorTotal;
	Escribir "Anticipo a pagar hoy (30 %): $", anticipo;
	Escribir "Saldo a pagar el día del recorrido: $", saldoPendiente;
FinAlgoritmo
