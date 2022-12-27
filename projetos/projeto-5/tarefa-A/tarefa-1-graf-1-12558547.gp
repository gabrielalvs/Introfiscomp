set terminal pngcairo size 640, 480
set output "tarefa-1-graf-1-12558547.png"
reset

set xlabel "x (AU)"
set ylabel "y (AU)"

#set xrange[-1.2:1.2]
#set yrange[-1.2:1.2]

unset grid
set size square

set style line 1 lc rgb "black"  lw 1 dt 3
set style line 2 lc rgb "yellow" lw 3 pointsize 8.5 pointtype 3
set style line 3 lc rgb "blue" lw 3 pointsize 2.5 pointtype 7

plot "tarefa-1-saida-1-12558547.dat" with lines ls 1 title "Orbita Terra/Sol",\
     'tarefa-1-saida-1-12558547.dat' every 30::1::360 with points ls 3 notitle,\
     "<echo '0 0'"   with points ls 2 notitle, \








