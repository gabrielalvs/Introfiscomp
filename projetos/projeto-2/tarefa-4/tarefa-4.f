c     program tarefa-4

      Parameter(it_n = 1000)
      Parameter(it_and = 1000)
      dimension rmatm_xy(it_and,3)
      dimension ip(2)
      Parameter(ip = (/-1,1/))
      Parameter(p = 2)
      Parameter(ient = 10)

      rmedx = 0e0
      rmedx2 = 0e0
      r = rand(iseed)
      do i=1,it_and
        rmatm_xy(i,1) = 0
        rmatm_xy(i,2) = 0
        do k=1,it_n
            r = rand()*p
            j = int((r+1)/p)+1
            r = rand()*p
            m = int((r+1)/p)+1
            rmatm_xy(i,j) = rmatm_xy(i,j) + ip(m)
        end do
        rmatm_xy(i,3) = sqrt(rmatm_xy(i,1)**2 + rmatm_xy(i,2)**2)
        rmedx = rmedx + rmatm_xy(i,3)
        rmedx2 = rmedx2 + rmatm_xy(i,3)**2
      end do
      rmedx = rmedx/it_and
      rmedx2 = rmedx2/it_and
      rmedx2 =  rmedx2 - rmedx**2

      write(*,*) '<r>: ', rmedx, '<Δ²>: ', rmedx2

      rmin = rmatm_xy(1,3)
      rmax = rmin
      do i = 2,it_and 
        if (.NOT. (rmin < rmatm_xy(i,3))) then
            rmin = rmatm_xy(i,3)
        end if
        if (.NOT. (rmax > rmatm_xy(i,3))) then
            rmax = rmatm_xy(i,3)
        end if  
      end do

      rmin = rmin -1 
      rmax = rmax +1

      amp = rmax - rmin
      rjan = 10
      rint = amp/rjan
      aux = rmin
      open(unit=ient,file='saida-4.dat')
      do while(aux<rmax) 
      rvalcolum = 0e0
      do i = 1,it_and 
        if (rmatm_xy(i,3)>=aux .and. rmatm_xy(i,3)< aux+rint) then
            rvalcolum = rvalcolum + 1
        end if
      end do
      write(ient,*) aux ,'-', aux + rint , rvalcolum
      aux = aux + rint
      end do
      close(ient)

      end

