c     program tarefa-8
      parameter(iseed = 10)

      write(*,*) 'Escreva o número de iterações:'
      read(*,*) n

      print *, "Volume em 2 dimensões: ", volume(n,2)
      print *, "Volume em 3 dimensões: ", volume(n,3)
      print *, "Volume em 4 dimensões: ", volume(n,4)

      end 

      function volume(n,idim)
        count = 0
        raio = 1e0
        r = rand(iseed)
        
        do i = 1, n
          aux = 0e0
          do id = 1,idim
              r = rand()
              aux = aux + (r**2)
          end do
          aux = sqrt(aux)
          if (aux <= raio) then
              count = count + 1
          end if
        end do

        volume  =  (2**idim)*(count/n)
        return
      end 