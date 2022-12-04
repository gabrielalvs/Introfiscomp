c     program tarefa-C
      implicit real*8 (a-h,o-z)
      Parameter(nite = 500000d0)
      Parameter(tempo = 150000d0)!segundos
      Parameter(rpi = 2d0*dacos(-1d0))
      Parameter(rg = 9.8d0)
      Parameter(rl = 9.8d0)
      Parameter(m = 1.0d0)
      Parameter(gamma = 0.5d0)
      Parameter(omm = 0.67d0)
      dimension f_0(2)

      Parameter(isaid1 = 10)
      Parameter(isaid2 = 20)
      open(unit=isaid1,file='tarefa-7-saida-1-12558547.dat')
      open(unit=isaid2,file='tarefa-7-saida-2-12558547.dat')

      f_0 = (/0.5d0,1.2d0/)

      deltat = (tempo*1d0)/(nite*1d0)

      do j = 1, 2

      theta1 = rpi/48d0 - 0.03d0
      omega1 = 0.0d0

      do i = 1, nite

c     calculo de omega1 
      omega1_p1 = omega1 -(rg/rl)*dsin(theta1)*deltat 
     +-gamma*omega1*deltat+f_0(j)*dsin(omm*deltat*i)*deltat

c     calculo de theta1 
      theta1_p1 = theta1 + omega1_p1*deltat

      if (mod(omm*deltat*i, (rpi/2d0)) < deltat/2d0) then
            write(10*j, *)  mod(50*rpi+theta1_p1,-rpi), omega1_p1
      end if 

      theta1 = theta1_p1
      omega1 = omega1_p1

      end do
      end do
      close(isaid1)
      close(isaid2)
      end