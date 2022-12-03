set terminal pngcairo size 640, 480
set output "grafico_oscilacao_f12.png"
reset

set xlabel "θ (rad)"
set ylabel "{/Symbol w} (rad/s)"
set title "grafico"
set grid

set xrange [-1:7]

set style line 1 lc rgb 'black' ps 1 pt 1

plot 'saida_oscilacao_f12.dat' using 1:2 with points ls 1 notitle