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
      dimension f_0(3)

      Parameter(isaid1 = 10)
      open(unit=isaid1,file='saida_oscilacao.dat')

      f_0 = (/0d0,0.5d0,1.2d0/)

      deltat = 0.03d0

      theta = rpi/48d0
      omega = 0.0d0

      theta2 = rpi/48d0
      omega2 = 0.0d0

      theta3 = rpi/48d0
      omega3 = 0.0d0

      do i = 1, nite

c     calculo de omega1 
      omega_p1 = omega -(rg/rl)*dsin(theta)*deltat  
     +-gamma*omega*deltat+f_0(1)*dsin(omm*deltat*i)*deltat

c     calculo de theta1 
      theta_p1 = theta + omega_p1*deltat

c     calculo de omega2 
      omega2_p1 = omega2 -(rg/rl)*dsin(theta2)*deltat 
     +-gamma*omega2*deltat+f_0(2)*dsin(omm*deltat*i)*deltat

c     calculo de theta2 
      theta2_p1 = theta2 + omega2_p1*deltat

c     calculo de omega3 
      omega3_p1 = omega3 -(rg/rl)*dsin(theta3)*deltat  
     +-gamma*omega3*deltat+f_0(3)*dsin(omm*deltat*i)*deltat

c     calculo de theta3 
      theta3_p1 = theta3 + omega3_p1*deltat

      write(isaid1,*) i*deltat, mod(50*rpi+theta_p1,-rpi),
     +mod(50*rpi+theta2_p1,-rpi),mod(50*rpi+theta3_p1,-rpi)

      theta = theta_p1
      omega = omega_p1

      theta2 = theta2_p1
      omega2 = omega2_p1

      theta3 = theta3_p1
      omega3 = omega3_p1

      end do
      close(isaid1)
      end