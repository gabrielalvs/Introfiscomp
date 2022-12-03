set terminal pngcairo size 640, 480
set output "grafico_oscilacao_f05.png"
reset

set xlabel "θ (rad)"
set ylabel "{/Symbol w} (rad/s)"
set title "grafico"
set grid

set style line 1 lw 4 lc rgb 'black' ps 1 pt 1

plot 'saida_oscilacao_f05.dat' using 1:2 with points ls 1 notitle