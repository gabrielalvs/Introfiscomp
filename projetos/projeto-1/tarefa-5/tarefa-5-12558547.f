c     program tarefa-5

      Parameter(itold_mat = 2)
      Parameter(ifat = 2)
      dimension iauxmat((itold_mat+1),ifat)
      dimension ioldmat(ifat,(itold_mat+1))
      dimension inewmat(ifat*(itold_mat+1),(itold_mat+2))
      Parameter(ient = 10)

      !leitura da matriz nxn do arquivo
      open(unit=ient,file='entrada-2-12558547.dat')
      Read(ient,*) iauxmat
      ioldmat = transpose(iauxmat)
      close(ient)

      i = 1 !linha 
      j = 1 !coluna
      k = 0
      n = itold_mat+1
      do while (i <= ifat*(itold_mat+1))
        if (j == itold_mat+2) then
          inewmat(i,j) = ioldmat(i-k,j-1)*((-1)**(k/ifat))
          if ((i/ifat)>(k/ifat)) then 
            k = k + ifat
          endif
          i = i + 1
          j = 1
        else
          if (j == (n -(k/ifat))) then
            inewmat(i,j) = itold_mat+1
          else
            if (j>(n -(k/ifat))) then
              inewmat(i,j) = ioldmat(i-k,j-1)
            else
              inewmat(i,j) = ioldmat(i-k,j)
            endif
          endif
          j =  j + 1   
        endif
      end do 

      !impressão da matriz (n+1)x(n+1) resultado no arquivo
      open(unit=ient,file='saida-2-12558547.dat')
      do i=1,ifat*(itold_mat+1)
        write(ient,*) (inewmat(i,k),k=1,(itold_mat+2)) 
      end do
      close(ient)
      
      end

