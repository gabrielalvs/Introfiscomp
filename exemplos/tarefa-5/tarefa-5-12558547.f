c     program tarefa-5
    
      Parameter(it_n = 100)
      Parameter(it_and = 1000)
      Parameter(janela = 10)
      dimension imatm_xy(it_and,2)
      Parameter(iaux = it_n/janela)
      dimension rprob(1:2*iaux,1:2*iaux)
      dimension ip(2)
      Parameter(ip = (/-1,1/))
      Parameter(p = 2)
      Parameter(ient = 10)

      do i=1,it_and
        imatm_xy(i,1) = 0
        imatm_xy(i,2) = 0
      end do

      r = rand(iseed)
      do k=1,it_n
        do i=1,it_and
            r = rand()*p
            j = int((r+1)/p)+1
            r = rand()*p
            m = int((r+1)/p)+1
            imatm_xy(i,j) = imatm_xy(i,j) + ip(m)
        end do
      end do

      do i = 1, 2*iaux
        do j = 1, 2*iaux
          rprob(i,j) = 0
        end do
      end do

      do k = 1, it_and
        ix = int(imatm_xy(k,1)/janela)
        if (mod(imatm_xy(k,1),janela) /= 0) then
          ix = ix + 1*((imatm_xy(k,1)+1)/abs(imatm_xy(k,1)+1))
        end if 
        
        iy = int(imatm_xy(k,2)/janela)
        if (mod(imatm_xy(k,2),janela) /= 0) then
          iy = iy + 1*((imatm_xy(k,2)+1)/abs(imatm_xy(k,2)+1))
        end if 
    
        rprob(iaux+ix,iaux+iy) = rprob(iaux+ix,iaux+iy) + 1
      end do


      do i = 1, 2*iaux
        do j = 1, 2*iaux
          rprob(i,j) = rprob(i,j)/it_and
          if (rprob(i,j) /= 0) then
            rprob(i,j) =  rprob(i,j)*log(rprob(i,j))
          end if
        end do
      end do

      rsum = 0
      do i = 1, 2*iaux
        do j = 1, 2*iaux
          rsum = rsum - rprob(i,j)
        end do
      end do

      
      write(*,*) rsum

      end

