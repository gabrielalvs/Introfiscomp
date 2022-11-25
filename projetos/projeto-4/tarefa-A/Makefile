MAIN = tarefa-A.f
BINARY = tarefa-A.exe
UTIL = grafico_energia.gp grafico_oscilacao.gp

all:
	f77 $(MAIN) -o $(BINARY)

run:
	./$(BINARY)
	
	gnuplot $(UTIL)