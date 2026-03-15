program riemann_sum
        implicit none

        integer :: i, j, k
        integer :: n
        real(8) :: x, y, z
        real(8) :: del_x, del_y , del_z, del_v
        real(8) :: r = 0.0
        ! set n , more number of n , more finer the mesh is
        n = 1000
        x = 0.0
        y = 0.0
        z = 0.0

        del_x = 4.0 / n
        del_y = 3.0 / n
        del_z = 2.0 / n
        del_v = del_x * del_y *  del_z

        print *, del_x, del_y , del_z , del_v
        do i = 1, n
                x = x + del_x
                do j = 1, n
                        y = y + del_y
                        do k = 1, n
                                z = z + del_z 
                                
                                r = r + func(x, y, z) * del_v
                        end do 
                        z = 0.0 
                end do
                y = 0.0 
        end do
        print *, "INTEGRAL = " , r

        contains
                function func(x,y,z) result(val)
                        real(8) :: x, y, z
                        real(8) :: val
                        val =   4 * x ** 3 + x * y ** 2 + 5 * y + y * z + 6 * z 
                end function
                        
end program riemann_sum
  



