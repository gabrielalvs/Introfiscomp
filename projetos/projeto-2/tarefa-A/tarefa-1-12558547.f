c     program tarefa-1

      Parameter(n = 4)
      Parameter(m = 1000)
      resp = 0.e0
      rr = rand(iseed)

      do i = 1,n
        resp = 0
        do j = 1,m
            rr = rand()
            resp = resp + rr**i
        end do
        write(*,3) i, resp/m
3       format('<rr**', i0,'>: ', e0.10)
      end do
      end