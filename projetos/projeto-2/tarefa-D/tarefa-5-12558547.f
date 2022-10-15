c     program tarefa-5    
      parameter (it_and = 1000)
      parameter (it_n = 1000)
      dimension imatm_xy(it_and, 2)
      dimension ip(2)
      Parameter(ip = (/-1,1/))
      Parameter(ient = 10)
      Parameter(p = 2)

      rnd = rand(iseed)

      do j = 1, it_and
         imatm_xy(j, 1) = 0
         imatm_xy(j, 2) = 0
      end do

      open(unit=ient,file='saida-5-12558547.dat')
      i = 0
      do while(i<it_n)
        i = i +1

         do j=1,it_and
            r = rand()*p
            k = int((r+1)/p)+1
            r = rand()*p
            m = int((r+1)/p)+1
            imatm_xy(j,k) = imatm_xy(j,k) + ip(m)
        end do

         ixmin = imatm_xy(1, 1)
         ixmax = ixmin
         iymin = imatm_xy(1, 2)
         iymax = iymin

         do j = 2, it_and
            if (.NOT. (ixmin < imatm_xy(j, 1))) then
               ixmin = imatm_xy(j, 1)
            end if
            if (.NOT. (ixmax > imatm_xy(j, 1))) then
               ixmax = imatm_xy(j, 1)
            end if          
            if (.NOT. (iymin < imatm_xy(j, 2))) then
               iymin = imatm_xy(j, 2)
            end if
            if (.NOT. (iymax > imatm_xy(j,2))) then
               iymax = imatm_xy(j, 2)
            end if
         end do

         entropy = 0e0
         iaux = 5
         
         do ix = ixmin, ixmax, iaux
            do iy = iymin, iymax, iaux
               count = 0e0
               do j = 1, it_and
                  iposX = imatm_xy(j,1) 
                  iposY = imatm_xy(j,2) 
                  if(((iposX <= ix + iaux) .and. (iposX >= ix)) .and. 
     +                 (iposY <= iy + iaux .and. iposY >= iy)) then
                     count = count + 1
                  end if
               end do
               if(count /= 0) then
                  prob = count / it_and
                  entropy = entropy - prob * log(prob)
               end if
            end do
         end do
         write(ient, *) i, entropy
      end do 
      close(ient)
      end