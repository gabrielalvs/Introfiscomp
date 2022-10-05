c     program tarefa-1

      Parameter(n = 4)
      Parameter(m = 1000)
      resp = 0.e0
      rr = rand(iseed)

      do i = 1,n
        do j = 1,m
            rr = rand()
            resp = resp +rr**j 
        end do
        write(*,*) '<rr>**',i,' : ', resp/m
      end do
      end