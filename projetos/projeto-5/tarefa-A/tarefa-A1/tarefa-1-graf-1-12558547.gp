set terminal pngcairo size 30cm, 10cm
set output "tarefa-1-graf-1-12558547.png"
reset

set xlabel "x (AU)"
set ylabel "y (AU)"

unset grid
set size square

# Sun
set style line 1 lc rgb "yellow" lw 3 pointsize 6.5 pointtype 7

# earth
set style line 2 lc rgb "blue" lw 4 pointsize 2.5 pointtype 7 dt 2

# mercury
set style line 3 lc rgb "grey" lw 3 pointsize 2.5 pointtype 7 dt 2
# venus
set style line 4 lc rgb "orange" lw 3 pointsize 2.5 pointtype 7 dt 2

# marte 
set style line 5 lc rgb "red" lw 3 pointsize 2.5 pointtype 7 dt 2

# jupiter
set style line 6 lc rgb "purple" lw 3 pointsize 2.5 pointtype 7 dt 2

# saturn
set style line 7 lc rgb "brown" lw 3 pointsize 2.5 pointtype 7 dt 2

# uranus
set style line 8 lc rgb "green" lw 3 pointsize 2.5 pointtype 7 dt 2

# netune
set style line 9 lc rgb "blue" lw 3 pointsize 2.5 pointtype 7 dt 2

# pluto
set style line 10 lc rgb "brown" lw 3 pointsize 2.5 pointtype 7 dt 2


# set style line 1 lc "black" lt 1 lw 2 dt 2
# set key outside
#set key right bottom;

set multiplot layout 1, 3


#set xrange[-1.2:1.2]
#set yrange[-1.2:1.2]

plot "tarefa-1-saida-1-12558547.dat" with lines ls 2 title "Terra", \
     "tarefa-1-saida-2-12558547.dat" with lines ls 3 title "Mercúrio"  ,\
     "tarefa-1-saida-3-12558547.dat" with lines ls 4 title "Venus"  
#set xrange[-20:20] 
#set yrange[-20:20] 

plot "tarefa-1-saida-4-12558547.dat" with lines ls 6 title "Jupiter" ,\
     "tarefa-1-saida-5-12558547.dat" with lines ls 7 title "Saturno" ,\
     "tarefa-1-saida-6-12558547.dat" with lines ls 5 title "Marte"  ,\
     "tarefa-1-saida-7-12558547.dat" with lines ls 8 title "Urano"  


#set xrange[-42:42]
#set yrange[-42:42]

plot "tarefa-1-saida-8-12558547.dat" with lines ls 6 title "Netuno" ,\
     "tarefa-1-saida-9-12558547.dat" with lines ls 7 title "Plutao"

unset multiplot 