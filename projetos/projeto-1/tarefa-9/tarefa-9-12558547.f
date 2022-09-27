c     program tarefa-9

      Parameter(pi=acos(-1.e0))
      Parameter(raio = 1e0 )
      Parameter(ient = 10)
      real*8:: volume
      real*8:: gama  
      n = 20
      dim = 0e0

      open(unit=ient,file='saida-3-12558547.dat')
      do i=1,n
        dim = dim +1
        volume = ((raio**(dim))*(pi**(dim/2)))/gama((dim/2)+1)
        write(ient,*)'Volume da esfera de ', i, 'dimensões: ', volume
      end do
      close(ient)

      end

      function gama(rent)
        real*8 :: dpi=acos(-1.d0)
        real*8 :: gama

        gama = 1
        do while (1>0)
          if (rent==1) then
           gama = gama*1
           return 
          end if 

          if (rent == 0.5) then
              gama = gama*sqrt(dpi)
              return
          end if

          rent = rent - 1
          gama = gama*rent
        end do
      end 
      