c     program tarefa-B
      implicit real*8 (a-h,o-z)
      Parameter(nite = 10000d0)!numero de interações 
      Parameter(tempo = 500d0)!segundos
      Parameter(rpi = 2d0*dacos(-1d0))!2pi
      Parameter(rg = 9.8d0)!gravidade
      Parameter(rl = 9.8d0)!comprimento do pendulo
      Parameter(m = 1.0d0)!massa do pendulo
      Parameter(in = 10d0)
      dimension rlist_tetha(6)

      Parameter(isaid1 = 10)
      open(unit=isaid1,file='saida_oscilacao.dat')

      rlist_tetha = (/(rpi/96.0d0),(rpi/48.0d0),(rpi/24.0d0),
     +(rpi/16.0d0),(rpi/8.0d0),(rpi/4.0d0)/)
      deltat = (tempo*1d0)/(nite*1d0)

      do l = 1,6 
      tetha_0 = rlist_tetha(l)

      theta = tetha_0
      omega = 0.0d0

      iter = 0 

      rboole = 0d0
      epson = 1d-7
      h = (2d0*tetha_0)/nite
      !write(*,*) epson, h
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
      do j = 1, (nite/4)-1
            xj = -tetha_0 + 4d0*j*h + epson
            rboole = rboole +7d0*fx(xj,-4d0,h,tetha_0) 
     ++32d0*fx(xj,-3d0,h,tetha_0) +12d0*fx(xj,-2d0,h,tetha_0)
     ++32d0*fx(xj,-1d0,h,tetha_0) +7d0*fx(xj,0d0,h,tetha_0)
      end do
      rboole =rboole*(2*h/45)

      rboole =rboole*dsqrt((2d0*rl)/rg)
      rboole =rboole +2d0*dsqrt((2d0*rl)/rg)*dsqrt(epson/dsin(tetha_0))

      analitico = rpi* (1 + tetha_0**2/16)
      write(*,*) rlist_tetha(l), (2d0*tempo)/iter, rboole,analitico

      end do

      close(isaid1)
      end

      function fx(x,dn,h,tetha_0)
            implicit real*8 (a-h,o-z)
            arg = x + dn*h
            fx = 1/dsqrt(dcos(arg)-dcos(tetha_0))
      end function