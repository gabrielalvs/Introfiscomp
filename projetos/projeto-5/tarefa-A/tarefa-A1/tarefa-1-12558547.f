c     program tarefa-A
      implicit real*8 (a-h,o-z)
      Parameter(nite = 91250d0)!numero de interações
      Parameter(tempo = 250d0)!anos
      Parameter(rpi = dacos(-1d0))!pi
      dimension x(0:2)
      dimension y(0:2)
      dimension r0(9)

      Parameter(isaid1 = 10)
      Parameter(isaid2 = 20)
      Parameter(isaid3 = 30)
      Parameter(isaid4 = 40)
      Parameter(isaid5 = 50)
      Parameter(isaid6 = 60)
      Parameter(isaid7 = 70)
      Parameter(isaid8 = 80)
      Parameter(isaid9 = 90)
      open(unit=isaid1,file='tarefa-1-saida-1-12558547.dat')
      open(unit=isaid2,file='tarefa-1-saida-2-12558547.dat')
      open(unit=isaid3,file='tarefa-1-saida-3-12558547.dat')
      open(unit=isaid4,file='tarefa-1-saida-4-12558547.dat')
      open(unit=isaid5,file='tarefa-1-saida-5-12558547.dat')
      open(unit=isaid6,file='tarefa-1-saida-6-12558547.dat')
      open(unit=isaid7,file='tarefa-1-saida-7-12558547.dat')
      open(unit=isaid8,file='tarefa-1-saida-8-12558547.dat')
      open(unit=isaid9,file='tarefa-1-saida-9-12558547.dat')

      r0 = (/0.39d0,0.72d0,1d0,1.52d0,5.20d0,9.24d0,
     +19.19d0,30.06d0,39.53d0/)

      do j = 1,9

            x(0) = r0(j)
            y(0) = 0d0

            v0x = 0d0
            v0y = sqrt((4d0*(rpi**2))/(r0(j)))

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

            c = abs(a - r0(j))

            t = 2d0*(tsum/(1d0*icont))

            write(*,*) "Périodo: ", t

            write(*,*) "Excentricidade: ", c/a

            write(*,*) "Périodo em dias: ", t*365

            write(*,*) "T²/r³", ((t**2)/(r0(j)**3))

            write(*,*) "---------------------------------"

      end do

      close(isaid1)
      close(isaid2)
      close(isaid3)
      close(isaid4)
      close(isaid5)
      close(isaid6)
      close(isaid7)
      close(isaid8)
      close(isaid9)

      end program