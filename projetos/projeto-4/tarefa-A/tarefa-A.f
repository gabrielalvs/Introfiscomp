c     program tarefa-A
      implicit real*8 (a-h,o-z)
      Parameter(nite = 1000d0)
      Parameter(tempo = 50d0)!segundos
      Parameter(rpi = 2d0*dacos(-1d0))
      Parameter(rg = 9.8d0)
      Parameter(rl = 9.8d0)
      Parameter(m = 1.0d0)

      Parameter(isaid1 = 10)
      Parameter(isaid2 = 20)
      open(unit=isaid1,file='saida_oscilacao.dat')
      open(unit=isaid2,file='saida_energia.dat')

      deltat = (tempo*1d0)/(nite*1d0)

      theta1 = rpi/48.0d0
      omega1 = 0.0d0

      theta2 = theta1
      omega2 = omega1

      ener1 = -m*rg*rl*dcos(theta1)
      ener2 = ener1

      do i = 1, nite

c     calculo de omega \ Método de Euler
      omega1_p1 = omega1 - (rg/rl)*theta1*deltat
c     calculo de theta \ Método de Euler
      theta1_p1 = theta1 + omega1*deltat

c     calculo de omega \ Método de Euler-Cromer
      omega2_p1 = omega2 - (rg/rl)*theta2*deltat
c     calculo de theta \ Método de Euler-Cromer
      theta2_p1 = theta2 + omega2_p1*deltat

      ener1 = m*rg*rl*dcos(theta1_p1)
     ++(1d0/2d0)*m*(omega1_p1**2d0)*(rl**2d0)
      ener2 = m*rg*rl*dcos(theta2_p1)
     ++(1d0/2d0)*m*(omega2_p1**2d0)*(rl**2d0)

      write(isaid1,*) i*deltat , theta1_p1, theta2_p1
      write(isaid2,*) i*deltat , ener1, ener2

      theta1 = theta1_p1
      omega1 = omega1_p1
      theta2 = theta2_p1
      omega2 = omega2_p1

      end do
      close(isaid1)
      close(isaid2)
      end