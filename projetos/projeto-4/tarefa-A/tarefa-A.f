c     program tarefa-A
      implicit real*8 (a-h,o-z)
      Parameter(nite = 1000d0)
      Parameter(tempo = 10d0)!segundos
      Parameter(rpi = 2d0*dacos(-1d0))
      Parameter(rg = 9.8d0)
      Parameter(rl = 9.8d0)

      Parameter(isaid = 10)
      open(unit=isaid,file='saida.dat')

      deltat = tempo/nite

      theta1 = rpi/48d0
      omega1 = 0d0

      theta2 = rpi/48d0
      omega2 = 0d0
      do i = 1, nite

c     calculo de omega \ Método de Euler
        omega1_p1 = omega1 - (rg/rl)*theta1*deltat
c     calculo de theta \ Método de Euler
        theta1_p1 = theta1 + omega1*deltat

c     calculo de omega \ Método de Euler-Cromer
        omega2_p1 = omega2 - (rg/rl)*theta2*deltat
c     calculo de theta \ Método de Euler-Cromer
        theta2_p1 = theta2 + omega2_p1*deltat

        write(isaid,*) i, omega1_p1, theta1_p1, omega2_p1, theta2_p1
        theta1 = theta1_p1
        omega1 = omega1_p1
        theta2 = theta2_p1
        omega2 = omega2_p1

      end do
      end