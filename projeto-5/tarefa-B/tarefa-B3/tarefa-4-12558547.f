c     program tarefa-B3
      implicit real*8 (a-h,o-z)
      Parameter(nite = 1000d0)!numero de interações
      Parameter(tempo = 50d0)!anos
      Parameter(rpi = dacos(-1d0))!pi
      dimension xt(0:2)
      dimension yt(0:2)
      dimension xj(0:2)
      dimension yj(0:2)
      dimension r0(3)
      dimension v0ya(3)

      Parameter(isaid1 = 10)
      Parameter(isaid2 = 20)
      Parameter(isaid3 = 30)
      open(unit=isaid1,file='tarefa-4-saida-1-12558547.dat')
      open(unit=isaid2,file='tarefa-4-saida-2-12558547.dat')
      open(unit=isaid3,file='tarefa-4-saida-3-12558547.dat')

      r0 = (/3.000d0,3.276d0,3.700d0/)
      v0ya = (/3.628d0,3.471d0,3.267d0/)

      do j = 1,3

              r0t = r0(j)
              r0j = 5.20d0

              xt(0) = r0t
              yt(0) = 0d0

              xj(0) = r0j
              yj(0) = 0d0

              v0xt = 0d0
              v0yt = v0ya(j)

              v0xj = 0d0
              v0yj = 2.755d0

              dt = (tempo*1d0)/(nite*1d0)

              !metodo de euler asteroides
              xt(1) = xt(0) + v0xt*dt
              yt(1) = yt(0) + v0yt*dt

              !metodo de euler jupiter
              xj(1) = xj(0) + v0xj*dt
              yj(1) = yj(0) + v0yj*dt

              write(10*j,*) xt(0),yt(0),xj(0),yj(0)
              write(10*j,*) xt(1),yt(1),xj(1),yj(1)

              do i = 2,nite
                     !raios
                     rjs = sqrt(xj(1)**2+yj(1)**2)
                     rts = sqrt(xt(1)**2+yt(1)**2)
                     rtj = sqrt((xt(1)-xj(1))**2+(yt(1)-yj(1))**2)

                     !asteroides
                     Gms_t = ((4d0*(rpi**2))/(rts**3))
                     Gmj_t = (((4d0*(rpi**2))/(10**3))/(rtj**3))

                     
                     yt(2) = 2d0*yt(1) - yt(0) 
     ++(-Gms_t*yt(1) - Gmj_t*(yt(1)-yj(1)))*(dt**2) 
                     xt(2) = 2d0*xt(1) - xt(0)  
     ++(-Gms_t*xt(1) - Gmj_t*(xt(1)-xj(1)))*(dt**2) 

                     !jupiter
                     Gms_j = ((4d0*(rpi**2))/(rjs**3))
                     Gmt_j = (((4d0*(rpi**2))/(3*10**5))/(rtj**3))

                     yj(2) = 2d0*yj(1) - yj(0) 
     ++(-Gms_j*yj(1) - Gmt_j*(yj(1)-yt(1)))*(dt**2) 
                     xj(2) = 2d0*xj(1) - xj(0)  
     ++(-Gms_j*xj(1) - Gmt_j*(xj(1)-xt(1)))*(dt**2) 

                     write(10*j,*) xt(2),yt(2),xj(2),yj(2)

                     !asteroides
                     xt(0) = xt(1)
                     yt(0) = yt(1)
                     xt(1) = xt(2)
                     yt(1) = yt(2)

                     !jupiter
                     xj(0) = xj(1)
                     yj(0) = yj(1)
                     xj(1) = xj(2)
                     yj(1) = yj(2)

              end do
       end do

      close(isaid1)
      close(isaid2)
      close(isaid3)

      end program