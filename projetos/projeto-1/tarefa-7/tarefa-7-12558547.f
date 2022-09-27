c     program tarefa-7

      Parameter(itmat = 4)
      Parameter(ifat = 24)
      dimension auxmatn(itmat,itmat)
      dimension rmattemp(itmat,itmat)
      dimension rmatA(itmat,itmat)
      dimension rvetY(itmat)
      Parameter(ient = 10)

      !leitura da matriz nxn
      open(unit=ient,file='entrada-5-12558547.dat')
      Read(ient,*) auxmatn
      rmatA = transpose(auxmatn)
      close(ient)

      !leitura do vetor
      open(unit=ient,file='entrada-6-12558547.dat')
      Read(ient,*) rvetY
      close(ient)

      
      !calculando os determinantes
      detD = 0e0
      call deter(itmat,ifat, rmatA, detD)
      do i=1,itmat
            rmattemp = rmatA
            do j=1,itmat
                  rmattemp(j,i) = rvetY(j)
            end do
            detaux = 0e0
            call deter(itmat,ifat, rmattemp, detaux) 
            write(*,*) (detaux/detD)  
      end do

      end

      subroutine deter(itmat,ifat, rmatn, det)
            dimension iauxmat((itmat+1),ifat)
            dimension ipermat(ifat,(itmat+1))
            dimension rmatn(itmat,itmat)
            Parameter(ientsub = 20)
      
            !leitura da matriz permutação do arquivo
            open(unit=ientsub,file='entrada-4-12558547.dat')
            Read(ientsub,*) iauxmat
            ipermat = transpose(iauxmat)
            close(ientsub)
            
            !calculo de determinante
            do i=1,ifat 
              aux = 1
              do j=1,itmat
                  aux = aux*rmatn(j,ipermat(i,j))
              end do
              aux = aux*ipermat(i,itmat+1)
              det = det + aux
            end do

            return
      end