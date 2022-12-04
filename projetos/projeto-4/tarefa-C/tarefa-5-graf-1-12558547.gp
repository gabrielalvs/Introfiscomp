set terminal pngcairo size 640, 480
set output "tarefa-5-graf-1-12558547.png"
reset

set xlabel "Tempo (s)"
set ylabel "ln({/Symbol D}θ) (rad)"
set grid

f(x) = a*x +b

fit f(x) 'tarefa-5-saida-1-12558547.dat' using 1:2 via a,b

set style line 1 lw 4 lc rgb 'black' ps 1 pt 1
set style line 2 lw 4 lc rgb 'red'

plot 'tarefa-5-saida-1-12558547.dat' using 1:2 with points ls 1 notitle,\
    f(x) ls 2 t 'Sistema com F_0 = 0.5'