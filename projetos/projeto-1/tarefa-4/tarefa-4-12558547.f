c     program tarefa-4

      Parameter(eprec = 1e-15)
      real*8 :: deprec = 1d-30
      real*8 :: daux = 1d0
      real*8 :: drespcos = 1d0
      real*8 :: dx 
      real*8 :: dfat 

      !leitura de x
      write(*,*) 'Digite o valor de x em radianos: '
      Read(*,*) dx
      rx = dx

      aux = 1e0
      respcos = 1e0
      i=2
      j = -1
      fat = 1e0
      do while (aux>eprec)
            fat = fat*(i-1)*(i)
            aux = ((rx**(i))/(fat))
            respcos = respcos + aux*j
            i = i + 2
            j = j*(-1)
      end do

      i=2
      j = -1
      dfat = 1d0
      do while (daux>deprec)
            dfat = dfat*(i-1)*(i)
            daux = ((dx**(i))/(dfat))
            drespcos = drespcos + daux*j
            i = i + 2
            j = j*(-1)
      end do

      if (isnan(respcos)) then
        write(*,*) 'função   cos(x): Memoria insuficiente'
      else
        write(*,*) 'função   cos(x): ' ,respcos
      end if 

      write(*,*)'fortran  cos(x): ' ,cos(rx)

      if (isnan(drespcos)) then
        write(*,*) 'função  dcos(x): Memoria insuficiente'
      else
        write(*,*) 'função  dcos(x): ' ,drespcos
      end if 

      write(*,*) 'fortran dcos(x): ' ,dcos(dx)
      end