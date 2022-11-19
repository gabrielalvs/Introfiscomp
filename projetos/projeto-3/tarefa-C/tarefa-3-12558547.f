c     program tarefa-2s
      implicit real*8 (a-h,o-z)
      Parameter(erro = 10d-6)
      Parameter(a = -10d0)
      Parameter(passo = 0.1d0)
      Parameter(nraizes = 3)
      Parameter(ient = 10)
      Logical :: flag

      open(unit=ient,file='saida-3-12558547.dat')

      !Método de busca direta
      write(ient,*) "--------------------------------------------------"
      write(ient,*) "Método de busca direta"

      x1 = a
      
      do i = 1,nraizes
        iter = 0 
        flag = .true.
        x2 = x1 + passo
        do while(flag .or. (abs(fx(x1)-fx(x2))>erro))
            if(fx(x1)*fx(x2)<0) then
                flag = .false.
                centro = (x1+x2)/2d0

                if(fx(x1)*fx(centro)<0) then
                  x2 = centro
                else
                  x1 = centro
                end if
                write(ient,*) iter, centro
            else
              x1 = x2
              x2 = x2 + passo
            end if
            iter = iter +1
        end do
        write(ient,*) "Resultado final: ",iter, centro
        x1 = x2
      end do

      !Método de Newton Raphson
      write(ient,*) "--------------------------------------------------"
      write(ient,*) "Método de Newton Raphson"
      
      x1 = a
      
      do i = 1,nraizes
        iter = 0 
        flag = .true.
        x2 = x1 + passo
        do while(flag)
          if(fx(x1)*fx(x2)<0) then
            x_new = (x1+x2)/2d0
            do while(flag)
              iter = iter +1
              x_old = x_new
              x_new = x_old - (fx(x_old))/(dfx(x_old))
      
              write(ient,*) iter,x_new
              if(abs(x_new-x_old)<=erro .or. abs(fx(x_new))<=erro)then
                flag = .false.
              end if
            end do
          else
            x1 = x2
            x2 = x2 + passo
          end if
          iter = iter +1
        end do
        write(ient,*) "Resultado final: ",iter-1, x_new
        x1 = x2
      end do

      !Método de Newton Raphson
      write(ient,*) "--------------------------------------------------"
      write(ient,*) "Método de Newton Raphson"
      
      x1 = a
      
      do i = 1,nraizes
        iter = 0
        flag = .true.
        x2 = x1 + passo
        x_2 = 0d0
        do while(flag)
          if(fx(x1)*fx(x2)<0) then
            do while(flag)
              x_1 = (x1+x2)/2d0
              x_0 = x1
              iter = iter +1

              x_2 = x_1 -fx(x_1)*((x_1-x_0)/(fx(x_1)-fx(x_0)))
      
              write(ient,*) iter,x_2
              if(abs(x_2-x_1)<=erro .or. abs(fx(x_2))<=erro)then
                flag = .false.
              end if
              x_0 = x_1
              x_1 = x_2
            end do
          else
            x1 = x2
            x2 = x2 + passo
          end if
          iter = iter +1
        end do
        write(ient,*) "Resultado final: ",iter-1, x_2
        x1 = x2
      end do
      
      close(ient)
      end

      function fx(x)
        implicit real*8 (a-h,o-z)
        fx =(x**3d0) - (3d0/2d0)*(x**2) - (3d0/2d0)*(x) + 1
       end function

       function dfx(x)
        implicit real*8 (a-h,o-z)
        dfx = 3d0*(x**2d0) - 3d0*(x) - (3d0/2d0)
       end function