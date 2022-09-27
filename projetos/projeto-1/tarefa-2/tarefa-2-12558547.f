c     program tarefa-2

      dimension vet(3,3)
      dimension auxvet(3)
       
      do i=1,3 
      	write(*,3) i
3       format('Escreva o valor do',i2,'º vetor:')     
      	Read(*,*) (vet(i,k),k=1,3)
      end do
      
      vet(3,1) = vet(3,1) - vet(2,1)
      vet(3,2) = vet(3,2) - vet(2,2)
      vet(3,3) = vet(3,3) - vet(2,3)    
      
      auxvet(1) = vet(1,2)*vet(2,3)-vet(1,3)*vet(2,2)
      auxvet(2) = -(vet(1,1)*vet(2,3)-vet(1,3)*vet(2,1))
      auxvet(3) = vet(1,1)*vet(2,2)-vet(1,2)*vet(2,1)
      
      volume = auxvet(1)*vet(3,1) + auxvet(2)*vet(3,2) 
     + +auxvet(3)*vet(3,3)
     
      area =  2*sqrt(auxvet(1)**2 + auxvet(2)**2 + auxvet(3)**2)
     
      auxvet(1) = vet(1,2)*vet(3,3)-vet(1,3)*vet(3,2)
      auxvet(2) = -(vet(1,1)*vet(3,3)-vet(1,3)*vet(3,1))
      auxvet(3) = vet(1,1)*vet(3,2)-vet(1,2)*vet(3,1)
     
      area = area + 2*sqrt(auxvet(1)**2 + auxvet(2)**2 + auxvet(3)**2)
     
      auxvet(1) = vet(3,2)*vet(2,3)-vet(3,3)*vet(2,2)
      auxvet(2) = -(vet(3,1)*vet(2,3)-vet(3,3)*vet(2,1))
      auxvet(3) = vet(3,1)*vet(2,2)-vet(3,2)*vet(2,1)
     
      area = area + 2*sqrt(auxvet(1)**2 + auxvet(2)**2 + auxvet(3)**2)
      
      write(*,*) "A area externa é:", area
      write(*,*) "O volume é:", volume
      
      
      
      
      end 

