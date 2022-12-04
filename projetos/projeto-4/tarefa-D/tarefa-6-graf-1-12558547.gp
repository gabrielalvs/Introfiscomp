set terminal pngcairo size 640, 480
set output "tarefa-6-graf-5-12558547.png"
reset

set xlabel "θ (rad)"
set ylabel "{/Symbol w} (rad/s)"
set grid

set xrange [-1:7]

set style line 1 lc rgb 'black' ps 1 pt 1

plot 'tarefa-6-saida-1-12558547.dat' using 1:2 with points ls 1 notitle