set terminal pngcairo size 640, 480
set output "grafico_oscilacao.png"
reset

set xlabel "Tempo (s)"
set ylabel "θ (rad)"
set title "grafico"
set key bmargin left horizontal Right noreverse enhanced autotitle nobox
set grid

set style line 1 lw 4 lc rgb 'black' ps 1 pt 1
set style line 2 lw 4 lc rgb 'blue' ps 1 pt 1
set style line 3 lw 4 lc rgb 'green' ps 1 pt 1

plot 'saida_oscilacao.dat' using 1:2 with points ls 1 t "teste1",\
    'saida_oscilacao.dat' using 1:3 with points ls 2 t "teste2",\
    'saida_oscilacao.dat' using 1:4 with points ls 3 t "teste3"