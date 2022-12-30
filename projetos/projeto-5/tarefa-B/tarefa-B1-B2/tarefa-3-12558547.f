c     program tarefa-B1-B2
      implicit real*8 (a-h,o-z)
      Parameter(nite = 1000d0)!numero de interações
      Parameter(tempo = 50d0)!anos
      Parameter(rpi = dacos(-1d0))!pi
      dimension xt(0:2)
      dimension yt(0:2)
      dimension xj(0:2)
      dimension yj(0:2)

      Parameter(isaid1 = 10)
      open(unit=isaid1,file='tarefa-3-saida-1-12558547.dat')

      r0t = 1d0
      r0j = 5.20d0

      xt(0) = r0t
      yt(0) = 0d0

      xj(0) = r0j
      yj(0) = 0d0

      v0xt = 0d0
      v0yt = sqrt((4d0*(rpi**2))/(r0t))

      v0xj = 0d0
      v0yj = sqrt((4d0*(rpi**2))/(r0j))

      dt = (tempo*1d0)/(nite*1d0)

      !metodo de euler terra
      xt(1) = xt(0) + v0xt*dt
      yt(1) = yt(0) + v0yt*dt

      !metodo de euler jupiter
      xj(1) = xj(0) + v0xj*dt
      yj(1) = yj(0) + v0yj*dt

      write(isaid1,*) xt(0),yt(0),xj(0),yj(0)
      write(isaid1,*) xt(1),yt(1),xj(1),yj(1)

      do i = 2,nite
            !raios
            rjs = sqrt(xj(1)**2+yj(1)**2)
            rts = sqrt(xt(1)**2+yt(1)**2)
            rtj = sqrt((xt(1)-xj(1))**2+(yt(1)-yj(1))**2)

            !terra
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

            write(isaid1,*) xt(2),yt(2),xj(2),yj(2)

            !terra
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

      close(isaid1)

      end program