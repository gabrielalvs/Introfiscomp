c     program tarefa-2
      implicit real*8 (a-h,o-z)
      implicit integer*8 (i-n)
      dimension ivn(10)
      Parameter(ient = 10)
      Parameter(a = 0d0)
      Parameter(b = 1d0)
      Parameter(in = 10d0)
      ivn = (/12,24,48,96,192,384,768,
     +1536,3072,6144/)

      open(unit=ient,file='saida-2-12558547.dat')
      do i = 1, in
        h = (b-a)/ivn(i)

        !regra do trapezio
        rtrap = 0d0
        do j = 1, (ivn(i)/2)
            xj = a + 2*j*h
            rtrap = +rtrap +fx(xj,-2d0,h) +2*fx(xj,-1d0,h) +fx(xj,0d0,h)
        end do
        rtrap = rtrap*(h/2)

        !regra de simpson
        rsim = 0d0
        do j = 1, (ivn(i)/2)
            xj = a + 2*j*h
            rsim = +rsim +fx(xj,-2d0,h) +4*fx(xj,-1d0,h) +fx(xj,0d0,h)        
        end do
        rsim = rsim*(h/3)

        !regra de boole
        rboole = 0d0
        do j = 1, (ivn(i)/4)
                xj = a+ 4*j*h
                rboole = + rboole + 7*fx(xj,-4d0,h) + 32*fx(xj,-3d0,h)! 
     ++ 12*fx(xj,-2d0,h)+32*fx(xj,-1d0,h)+7*fx(xj,0d0,h)
        end do
        rboole = rboole*(2*h/45)

        rana = fana(a,b) 
        write(ient,*) ivn(i), h ,abs(rtrap-rana),abs(rsim-rana),
     +  abs(rboole-rana)
      end do

      close(ient)

      end program

      function fx(x,dn,h)
       implicit real*8 (a-h,o-z)
       Parameter(rpi=dacos(-1.d0))
       arg = x + dn*h
       fx = dexp((arg/4d0))*dsin(rpi*arg)
      end function

      function fana(a,b)
        implicit real*8 (a-h,o-z)
        Parameter(rpi=dacos(-1.d0))
        fana = -((4d0*dexp(b/4d0)*(4d0*rpi*dcos(rpi*b)-dsin(rpi*b)))
     +   /(1d0+16d0*(rpi**2)))
        fana = fana + ((4d0*dexp(a/4d0)*(4d0*rpi*dcos(rpi*a)
     +   -dsin(rpi*a)))/(1d0+16d0*(rpi**2)))
       end function