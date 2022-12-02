set terminal pngcairo size 640, 480
set output "grafico_energia.png"
reset

set xlabel "Tempo (s)"
set ylabel "Energia (J)"
set grid

set style line 1 lc rgb "red" lw 3 
set style line 2 lc rgb "green" lw 3 

plot 'saida_energia.dat' using 1:2 with lines ls 1 t "Método de Euler",\
    'saida_energia.dat' using 1:3 with lines ls 2 t "Método de Euler-Cromer"