c     program tarefa-A
      implicit real*8 (a-h,o-z)
      Parameter(nite = 1000d0)!numero de interações
      Parameter(tempo = 10d0)!anos
      Parameter(rpi = dacos(-1d0))!pi
      dimension x(0:2)
      dimension y(0:2)

      Parameter(isaid1 = 10)
      open(unit=isaid1,file='tarefa-2-saida-1-12558547.dat')

      do j = 1,10

            r0 = 1

            x(0) = r0
            y(0) = 0d0

            v0x = 0d0
            v0y = (j/5d0)*rpi

            dt = (tempo*1d0)/(nite*1d0)

            !metodo de euler
            x(1) = x(0) + v0x*dt
            y(1) = y(0) + v0y*dt

            write(10*j,*) x(0),y(0)
            write(10*j,*) x(1),y(1)

            icont = 0
            rsum = 0d0
            tsum = 0
            taux = 0

            do i = 2,nite

                  r = sqrt(x(1)**2+y(1)**2)
                  Gms = ((4d0*(rpi**2))/(r**3))

                  y(2) = 2d0*y(1) - y(0) -Gms*y(1)*(dt**2)
                  x(2) = 2d0*x(1) - x(0) -Gms*x(1)*(dt**2)

                  write(10*j,*) x(2),y(2)

                  if (y(1)*y(2) < 0) then
                        icont = icont + 1

                        rsum = rsum + abs(r)

                        tsum = tsum + (dt*i - taux) 

                        taux = dt*i
                  end if

                  x(0) = x(1)
                  y(0) = y(1)
                  x(1) = x(2)
                  y(1) = y(2)

            end do

            a = rsum/(1d0*icont)

            c = abs(a - r0)

            t = 2d0*(tsum/(1d0*icont))

            write(*,*) "Excentricidade: ", c/a

            write(*,*) "Foco 2: (",0+c,",",0,")"

            write(*,*) "T²/a³: ", ((t**2)/(a**3))

            write(*,*) "---------------------------------"

      end do

      close(isaid1)

      end program