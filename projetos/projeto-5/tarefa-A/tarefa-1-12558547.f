c     program tarefa-A
      implicit real*8 (a-h,o-z)
      Parameter(nite = 1000d0)!numero de interações
      Parameter(tempo = 1d0)!anos
      Parameter(rpi = dacos(-1d0))!pi
      dimension x(0:2)
      dimension y(0:2)

      Parameter(isaid1 = 10)
      open(unit=isaid1,file='tarefa-1-saida-1-12558547.dat')
      !x(0) = 1d0
      x(0) = 1d0
      y(0) = 0d0

      v0x = 0d0
      v0y = 2d0*rpi

      dt = (tempo*1d0)/(nite*1d0)

      !metodo de euler
      x(1) = x(0) + v0x*dt
      y(1) = y(0) + v0y*dt

      write(isaid1,*) x(0),y(0)
      write(isaid1,*) x(1),y(1)

      icont = 0

      rinit = sqrt(x(1)**2+y(1)**2)
      rsum = 0d0
      tsum = 0

      do i = 2,nite

            r = sqrt(x(1)**2+y(1)**2)
            Gms = ((4d0*(rpi**2))/(r**3))

            y(2) = 2d0*y(1) - y(0) -Gms*y(1)*(dt**2)
            x(2) = 2d0*x(1) - x(0) -Gms*x(1)*(dt**2)

            write(isaid1,*) x(2),y(2)

            if (y(1)*y(2) < 0) then
                  icont = icont + 1
                  rsum = rsum + abs(r)
                  tsum = dt*i 
            end if

            x(0) = x(1)
            y(0) = y(1)
            x(1) = x(2)
            y(1) = y(2)

      end do

      !rperiodo  = (2d0*tempo)/icont

      a = rsum/(1d0*icont)

      c = a - rinit

      t = 2*(tsum/(1d0*icont))

      write(*,*) "Périodo: ", t

      write(*,*) "Excentricidade: ", c/a

      close(isaid1)
      end