set terminal pngcairo size 640, 480
set output "grafico_oscilacao.png"
reset

set xlabel "Tempo (s)"
set ylabel "θ (rad)"

set style line 1 lc rgb "black" lw 3

plot 'saida_oscilacao.dat' using 1:2 with lines ls 1 t "Amortecimento"