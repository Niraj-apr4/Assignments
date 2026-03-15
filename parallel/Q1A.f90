program riemann_sum
    ! question1 -- riemann summation 
        use omp_lib
        implicit none

        integer :: i, j, k
        integer :: nx = 48 , ny = 36, nz = 24
        real(8) :: x, y, z
        real(8) :: del_x, del_y , del_z, del_v
        real(8) :: r = 0.0
        real(8) :: start ,finish
        ! set n , more number of n , more finer the mesh is

        x = 0.0
        y = 0.0
        z = 0.0

        del_x = 4.0 / nx
        del_y = 3.0 / ny
        del_z = 2.0 / nz
        del_v = del_x * del_y *  del_z
        call cpu_time(start)
        !$omp parallel do private(i, j, k, x, y, z) reduction(+:r)
        do i = 1, nx
            x = i * del_x
            do j = 1, ny
                y = j * del_y
                do k = 1, nz
                    z = k * del_z
                    r = r + func(x, y, z) * del_v
                end do
            end do
        end do
        call cpu_time(finish)
        print *, "nthreads : ", "8 ", "time taken :", finish-start, "INTEGRAL = ",r  

        contains
                function func(x,y,z) result(val)
                        real(8) :: x, y, z
                        real(8) :: val
                        val =   4 * x ** 3 + x * y ** 2 + 5 * y + y * z + 6 * z 
                end function
                        
end program riemann_sum
  



