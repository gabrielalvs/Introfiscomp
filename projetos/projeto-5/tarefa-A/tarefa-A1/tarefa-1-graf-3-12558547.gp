set terminal pngcairo size 640, 480
set output "tarefa-1-graf-3-12558547.png"
reset

set xlabel "x (AU)"
set ylabel "y (AU)"

#set xrange[-1.2:1.2]
#set yrange[-1.2:1.2]

unset grid
set size square

set style line 1 lc rgb "black"  lw 1 dt 1
set style line 2 lc rgb "red"  lw 1 dt 1
set style line 3 lc rgb "blue"  lw 1 dt 1
set style line 4 lc rgb "yellow" lw 3 pointsize 8.5 pointtype 3

plot "tarefa-1-saida-7-12558547.dat" with lines ls 1 title "Orbita Terra/Sol",\
     "tarefa-1-saida-8-12558547.dat" with lines ls 2 title "Orbita Terra/Sol",\
     "tarefa-1-saida-9-12558547.dat" with lines ls 3 title "Orbita Terra/Sol",\
     "<echo '0 0'"   with points ls 4 notitle, \








