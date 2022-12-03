MAIN = tarefa-D.f
BINARY = tarefa-D.exe
UTIL = grafico_oscilacao_f05.gp grafico_oscilacao_f12.gp

all:
	f77 $(MAIN) -o $(BINARY)

run:
	./$(BINARY)
	
	gnuplot $(UTIL)