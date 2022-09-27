c     program tarefa-6
      
      Parameter(itmat = 3)
      Parameter(ifat = 6)
      dimension iauxmat((itmat+1),ifat)
      dimension ipermat(ifat,(itmat+1))
      dimension rmatn(itmat,itmat)
      Parameter(ient = 10)
      real*8 :: det = 0d0

      !leitura da matriz permutação do arquivo
      open(unit=ient,file='entrada-3-12558547.dat')
      Read(ient,*) iauxmat
      ipermat = transpose(iauxmat)
      close(ient)

      !leitura da matriz nxn
      write(*,*) 'Escreva a matriz para o calculo do determinante: '
      do i=1,itmat 
        Read(*,*) (rmatn(i,k),k=1,itmat)
      end do
      
      !calculo de determinante
      do i=1,ifat 
        aux = 1
        do j=1,itmat
            aux = aux*rmatn(j,ipermat(i,j))
        end do
        aux = aux*ipermat(i,itmat+1)
        det = det + aux
      end do
      
      !resultado do determinante
      write(*,*) "O determiante é: ", det

      end