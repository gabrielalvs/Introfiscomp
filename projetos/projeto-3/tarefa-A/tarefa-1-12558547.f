c     program tarefa-1
      implicit real*8 (a-h,o-z)
      Parameter(x=0.5d0)
      dimension vh(14)
      Parameter(ient = 10)
      vh = (/0.5d0,0.2d0,0.1d0,0.05d0,0.01d0,0.005d0,0.001d0,
     +0.0005d0, 0.0001d0, 0.00005d0, 0.00001d0, 
     +0.000001d0, 0.0000001d0, 0.00000001d0/)

      open(unit=ient,file='saida-1-12558547.dat')
      write(ient,3)
3           format(169('-')) 
      do i = 1, 14

            !derivada simétrica de 3 pontos
            d_sim3 = fx(x,1d0,vh(i)) - fx(x,-1d0,vh(i))
            d_sim3 = d_sim3/(vh(i)*2d0)

            !derivada para frente de 2 pontos
            d_frente2 = fx(x,1d0,vh(i)) - fx(x,0d0,vh(i))
            d_frente2 = d_frente2/(vh(i))

            !derivada para trás de 2 pontos
            d_tras2 = fx(x,0d0,vh(i)) - fx(x, -1d0, vh(i))
            d_tras2 = d_tras2/(vh(i))

            !derivada simétrica de 5 pontos
            d_sim5 = fx(x,-2d0,vh(i)) -8d0*fx(x,-1d0,vh(i)) 
            d_sim5 = d_sim5 +8d0*fx(x,1d0,vh(i)) -fx(x,2d0,vh(i))
            d_sim5 = d_sim5/(vh(i)*12d0)

            !derivada segunda simétrica de 5 pontos
            d_sec_s2 = -fx(x,-2d0,vh(i)) +16d0*fx(x,-1d0,vh(i))  
            d_sec_s2 = d_sec_s2 -30d0*fx(x,0d0,vh(i)) 
            d_sec_s2 = d_sec_s2 +16d0*fx(x,1d0,vh(i))-fx(x,2d0,vh(i))
            d_sec_s2 = d_sec_s2/((vh(i)**2d0)*12d0)

            !derivada terceira anti-simétrica de 5 pontos
            d_ter_as5 = -fx(x,-2d0,vh(i)) +2d0*fx(x,-1d0,vh(i))
            d_ter_as5 = d_ter_as5 -2d0*fx(x,1d0,vh(i)) +fx(x,+2d0,vh(i))
            d_ter_as5 = d_ter_as5/((vh(i)**3d0)*2d0)

            write(ient,4) abs(d_sim3-d1fx(x)), abs(d_frente2-d1fx(x)), 
     +abs(d_tras2-d1fx(x)), abs(d_sim5-d1fx(x)), abs(d_sec_s2-d2fx(x)), 
     +abs(d_ter_as5-d3fx(x))
4           format('| ', 6(d25.18,' | '))
      end do

      write(ient,5)
5           format(169('-'))

      write(ient,6) d1fx(x), d1fx(x), 
     +d1fx(x), d1fx(x), d2fx(x), d3fx(x)
6           format('| ', 6(d25.18,' | '))

      write(ient,7)
7           format(169('-')) 
      close(ient)

      end program

      function fx(x,dn,h)
            implicit real*8 (a-h,o-z)
            arg = x + dn*h
            fx = dcosh(3d0*arg)*dsin((arg/2d0))
      end function

      function d1fx(x)
            implicit real*8 (a-h,o-z)
            d1fx = 3d0*dsin(x/2d0)*dsinh(3d0*x)
     ++(1d0/2d0)*dcos(x/2d0)*dcosh(3d0*x)       
      end function

      function d2fx(x)
            implicit real*8 (a-h,o-z)
            d2fx = (35d0/4d0)*dcosh(3d0*x)*dsin(x/2d0)
     ++3d0*dcos(x/2d0)*dsinh(3d0*x)   
      end function

      function d3fx(x)
            implicit real*8 (a-h,o-z)
            d3fx = (107d0/8d0)*dcos(x/2d0)*dcosh(3d0*x) 
     ++ (99d0/4d0)*dsin(x/2d0)*dsinh(3d0*x)  
      end function