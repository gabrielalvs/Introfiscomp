c     program tarefa-4

      Parameter(it_n = 100)
      Parameter(it_and = 100)
      dimension rmatm_xy(it_and,2)
      dimension ip(2)
      Parameter(ip = (/-1,1/))
      Parameter(p = 2)
      Parameter(ient = 10)

      rx = 0
      ry = 0
      rx2 = 0
      ry2 = 0
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
        rx = rmatm_xy(i,1) +rx
        ry = rmatm_xy(i,2) +ry
        rx2 = rmatm_xy(i,1)**2 +rx2  
        ry2 = rmatm_xy(i,2)**2 +ry2
      end do
      rmedx = (rx/it_and)**2 +(ry/it_and)**2
      rmedx2 = (sqrt(rx2/it_and)**2 + (ry2/it_and)**2) - rmedx
      rmedx = sqrt(rmedx)

      write(*,*) '<r>: ', rmedx, '<Δ²>: ', rmedx2

      open(unit=ient,file='saida-3-12558547.dat')
      do i = 1, it_and
        write(ient,*) rmatm_xy(i,1), rmatm_xy(i,2)
      end do
      close(ient)

      end

