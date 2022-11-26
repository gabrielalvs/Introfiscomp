c     program tarefa-B
      implicit real*8 (a-h,o-z)
      Parameter(nite = 1536d0)
      Parameter(tempo = 50d0)!segundos
      Parameter(rpi = 2d0*dacos(-1d0))
      Parameter(rg = 9.8d0)
      Parameter(rl = 9.8d0)
      Parameter(m = 1.0d0)

      Parameter(isaid1 = 10)
      open(unit=isaid1,file='saida_oscilacao.dat')

      deltat = (tempo*1d0)/(nite*1d0)
      theta = rpi/24.0d0
      omega = 0.0d0
      iter = 0 

      do i = 1, nite

c     calculo de omega 
      omega_p1 = omega - (rg/rl)*dsin(theta)*deltat
c     calculo de theta 
      theta_p1 = theta + omega_p1*deltat

      if(theta_p1*theta<0) then
            iter = iter +1
      end if

      theta = theta_p1
      omega = omega_p1

      end do

      !regra de boole
      rboole = 0d0
      tetha_0 = rpi/24.0d0
      epson = 1d-4
      h = (2d0*tetha_0)/nite
      do j = 1, (nite/4)-1
            xj = -tetha_0 + 4d0*j*h + epson
            rboole = rboole +7d0*fx(xj,-4d0,h,tetha_0) 
     ++32d0*fx(xj,-3d0,h,tetha_0) +12d0*fx(xj,-2d0,h,tetha_0)
     ++32d0*fx(xj,-1d0,h,tetha_0) +7d0*fx(xj,0d0,h,tetha_0)
      write(*,*)rboole*(2*h/45)
      end do
      rboole = rboole*(2*h/45)
      rboole = rboole + 2d0*dsqrt(2d0*rl/rg)*dsqrt(epson/dsin(tetha_0))
      write(*,*) iter, (2d0*tempo)/iter, rboole

      close(isaid1)
      end

      function fx(x,dn,h,tetha_0)
            implicit real*8 (a-h,o-z)
            arg = x + dn*h
            fx = 1/dsqrt(dcos(arg)-dcos(tetha_0))
      end function