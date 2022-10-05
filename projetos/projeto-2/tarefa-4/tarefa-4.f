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

      open(unit=ient,file='saida-4.dat')
      do i = 1, it_and
        write(ient,*) rmatm_xy(i,1), rmatm_xy(i,2)
      end do
      close(ient)

      end

