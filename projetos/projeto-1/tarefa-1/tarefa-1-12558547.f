c     program tarefa-1
 
      Parameter(rpi=acos(-1.e0))
      
      write(*,*) 'Digite o valor do raio interno: '
      Read(*,*) rr1

      write(*,*) 'Digite o valor do raio externo: '
      Read(*,*) rr2
      
      rarea = 4*(rpi**2)*rr1*rr2
      rvolume = 2*(rpi**2)*(rr1**2)*rr2
      
      write(*,*) 'A area e o volume calculados são:', rarea, rvolume
      
      end 

