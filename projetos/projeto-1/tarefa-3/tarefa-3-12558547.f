c     program tarefa-3

      Parameter(ivet = 20)!tamanho do vetor
      dimension vet(ivet)
      Parameter(ient = 10)

      !leitura do vetor n do arquivo
      open(unit=ient,file='entrada-1-12558547.dat')
      Read(ient,*) vet
      close(ient)

      !leitura do numero de algarismos a ser ordenado
      write(*,*) 'Digite o número de algarismos a ser ordenado: '
      Read(*,*) n

      !metodo de ordenação
      do i = 1, n
            do j = ivet, i, -1
                  if (vet(j)<vet(j-1)) then
                        aux = vet(j-1)
                        vet(j-1) = vet(j)
                        vet(j) = aux 
                  end if
            end do
      end do

      open(unit=ient,file='saida-1-12558547.dat')
      do i=1,ivet
            write(ient,*) vet(i) 
      end do
      write(ient,*)'Número de alagarismos ordenados é: ', n
      close(ient)

      end

