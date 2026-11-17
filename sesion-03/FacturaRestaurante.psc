SubProceso subtotal <- LeerPedido
	Definir subtotal Como Real
	Definir item como Real
	Escribir "Valor del item (0 para cerrar la cuenta): "
	Leer item
	Mientras item <> 0 Hacer
		subtotal <- subtotal + item
		Escribir "Valor del item (0 para cerrar la cuenta): "
		Leer item
	FinMientras
FinSubProceso

SubProceso valorPorcentaje <- CalcularPorcentaje(subtotal, porcentaje)
	valorPorcentaje<- subtotal * (porcentaje/100)
FinSubProceso

SubProceso ImprimirFactura(subtotal, impuesto, propina)
	Escribir "----FACTURA DE VENTA----"
	Escribir "Subtotal: $", subtotal
	Escribir "Impuesto: $", impuesto
	Escribir "Propina sugerida: $", propina
	Escribir "Total: $", subtotal + impuesto + propina
FinSubProceso

Algoritmo FacturaRestaurante
	definir subtotal, impuesto, propina Como Real
	subtotal <- LeerPedido()
	impuesto <- CalcularPorcentaje(subtotal, 8)
	propina <- CalcularPorcentaje(subtotal, 10)
	ImprimirFactura(subtotal, impuesto, propina)
FinAlgoritmo
