c     program tarefa-A
      implicit real*8 (a-h,o-z)
      Parameter(nite = 1000d0)
      Parameter(tempo = 50d0)!segundos
      Parameter(rpi = 2d0*dacos(-1d0))
      Parameter(rg = 9.8d0)
      Parameter(rl = 9.8d0)
      Parameter(m = 1.0d0)
      Parameter(gamma = 0.5d0)
      Parameter(omm = 0.67d0)
      Parameter(f_0 = 1.2d0)

      Parameter(isaid1 = 10)
      open(unit=isaid1,file='saida_oscilacao.dat')

      deltat = 0.03d0

      theta = rpi/48.0d0
      omega = 0.0d0

      do i = 1, nite

c     calculo de omega 
      omega_p1 = omega -(rg/rl)*dsin(theta)*deltat -gamma*omega*deltat 
     ++ f_0*dsin(omm*deltat*i)

c     calculo de theta 
      theta_p1 = theta + omega_p1*deltat

      write(isaid1,*) i*deltat , theta_p1

      theta = theta_p1
      omega = omega_p1

      end do
      close(isaid1)
      end