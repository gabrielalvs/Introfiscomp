set terminal pngcairo size 640, 480
set output "tarefa-1-graf-1-12558547.png"
reset

set xlabel "Tempo (s)"
set ylabel "θ (rad)"
set grid

set style line 1 lc rgb "red" lw 3 
set style line 2 lc rgb "green" lw 3 

plot 'tarefa-1-saida-1-12558547.dat' using 1:2 with lines ls 1 t "Método de Euler",\
    'tarefa-1-saida-1-12558547.dat' using 1:3 with lines ls 2 t "Método de Euler-Cromer"