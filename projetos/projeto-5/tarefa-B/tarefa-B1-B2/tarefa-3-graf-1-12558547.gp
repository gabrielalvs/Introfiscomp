set terminal pngcairo size 640, 480
set output "tarefa-3-graf-1-12558547.png"
reset

set xlabel "x (AU)"
set ylabel "y (AU)"

#set xrange[-1.2:1.2]
#set yrange[-1.2:1.2]

unset grid
set size square
set key out horiz
set key bottom center

set style line 1 lc rgb "black"  lw 1 dt 1
set style line 2 lc rgb "red"  lw 1 dt 1
set style line 3 lc rgb "yellow" lw 3 pointsize 8.5 pointtype 3

plot "tarefa-3-saida-1-12558547.dat" using 1:2 with lines ls 1 title "Terra",\
     "tarefa-3-saida-1-12558547.dat" using 3:4 with lines ls 2 title "Júpiter",\
     "<echo '0 0'"   with points ls 3 notitle, \








