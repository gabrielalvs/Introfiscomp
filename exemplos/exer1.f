      Parameter(rpi=acos(-1.e0))
     
      write(*,*) 'Digite os valores dos raios: '
      Read(*,*) rr1,rr2
     
      rarea = 4*(rpi**2)*rr1*rr2
      rvolume = 2*(rpi**2)*(rr1**2)*rr2
     
      write(*,*) 'A area e o volume são:', rarea,rvolume
     
      end 

