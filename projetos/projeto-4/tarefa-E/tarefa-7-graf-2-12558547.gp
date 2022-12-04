set terminal pngcairo size 640, 480
set output "tarefa-7-graf-6-12558547.png"
reset

set xlabel "θ (rad)"
set ylabel "{/Symbol w} (rad/s)"
set title "grafico"
set grid

set style line 1 lc rgb 'black' ps 1 pt 1

plot 'tarefa-7-saida-2-12558547.dat' using 1:2 with points ls 1 notitle