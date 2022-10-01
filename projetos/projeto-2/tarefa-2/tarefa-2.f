c     program tarefa-2

      Parameter(it_n = 10000)
      Parameter(it_and = 10)
      dimension imatm(it_n)
      dimension ip(2)
      Parameter(ip = (/-1,1/))
      Parameter(ient = 10)
    
      rmedx = 0e0
      rmedx2 = 0e0
      r = rand(iseed)
      do i=1,it_and
        n = 0
        do k=1,it_n
            r = rand()*2
            j = int((r+1)/2)+1
            n = n + ip(j)
        end do
        imatm(i) = n
        write(*,*) imatm(i)
        rmedx = rmedx + n
        rmedx2 = rmedx2 + n*n
      end do

      write(*,*) '<x>: ', (rmedx/it_and), '<x²>',(rmedx2/it_and)
      
      min = imatm(1)
      max = min
      do i = 2,it_and 
        if (.NOT. (min < imatm(i))) then
            min = imatm(i)
        end if
        if (.NOT. (max > imatm(i))) then
            max = imatm(i)
        end if  
      end do

      write(*,*) min, max

      min = min -1 
      max = max +1

      amp = max - min
      jan = 10
      rint = amp/jan
      aux = min
      open(unit=ient,file='saida-2.dat')
      do k = 1,jan
        rvalcolum = 0e0
        do i = 1,it_and 
            if (imatm(i)>=aux .and. imatm(i)< aux+rint) then
                rvalcolum = rvalcolum + 1
            end if
        end do
        write(ient,*) aux ,'-', aux + rint , rvalcolum
        aux = aux + rint
      end do
      close(ient)

      end

