set terminal pngcairo size 640, 480
set output "grafico_oscilacao_f05.png"
reset

set xlabel "Tempo (s)"
set ylabel "θ (rad)"
set title "grafico"
set grid

f(x) = a*x +b

fit f(x) 'saida_oscilacao_f05.dat' using 1:2 via a,b

set style line 1 lw 4 lc rgb 'black' ps 1 pt 1
set style line 2 lw 4 lc rgb 'red'

plot 'saida_oscilacao_f05.dat' using 1:2 with points ls 1 notitle,\
    f(x) ls 2 t 'Sistema com F_0 = 0.5'