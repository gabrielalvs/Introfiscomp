set terminal pngcairo size 640, 480
set output "tarefa-3-graf-1-12558547.png"
reset

set xlabel "Tempo (s)"
set ylabel "θ (rad)"
set grid

set style line 1 lc rgb "black" lw 3

plot 'tarefa-3-saida-1-12558547.dat' using 1:2 with lines ls 1 t "Modelo com {/Symbol g} = 0.5"