set terminal pngcairo size 640, 480
set output "tarefa-4-graf-1-12558547.png"
reset

set xlabel "Tempo (s)"
set ylabel "θ (rad)"
set key bmargin left horizontal Right noreverse enhanced autotitle nobox
set grid

set style line 1 lw 4 lc rgb 'black' ps 1 pt 1
set style line 2 lw 4 lc rgb 'blue' ps 1 pt 1
set style line 3 lw 4 lc rgb 'green' ps 1 pt 1

plot 'tarefa-4-saida-1-12558547.dat' using 1:2 with points ls 1 t "F_0 = 0",\
    'tarefa-4-saida-1-12558547.dat' using 1:3 with points ls 2 t "F_0 = 0.5",\
    'tarefa-4-saida-1-12558547.dat' using 1:4 with points ls 3 t "F_0 = 1.2"