set terminal pngcairo size 640, 480
set output "grafico_oscilacao.png"
reset

set xlabel "Tempo (s)"
set ylabel "Posição (m)"

set style line 1 lc rgb "red" lw 3 
set style line 2 lc rgb "green" lw 3 

plot 'saida_oscilacao.dat' using 1:2 with lines ls 1 t "Método de Euler",\
    'saida_oscilacao.dat' using 1:3 with lines ls 2 t "Método de Euler-Cromer"