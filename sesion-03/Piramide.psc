Algoritmo Piramide
	Definir n, file, j Como Entero
	Escribir "Altura de la piramide: "
	leer n
	para fila <- 1 Hasta n Hacer
		para j <- 1 hasta n - fila Con Paso 1 Hacer
			Escribir Sin Saltar " "
		FinPara
		para j <- 1 Hasta 2 * fila - 1 Hacer
			Escribir Sin Saltar "*"
		FinPara
		Escribir ""
	FinPara
FinAlgoritmo
