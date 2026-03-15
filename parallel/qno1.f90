program monte_carlo
    use omp_lib
    implicit none 

    ! variable declararions 
    integer, parameter :: N = 100000
    integer :: nthreads 
    real(8) , dimension(N) :: x, y, z
    real(8) :: val , f_sum = 0.0d0 , f_sq_sum = 0.0d0 , f_avg, f_sq_avg , f_rms , vol
    real(8) :: ans
    integer :: i 
    real(8) :: start, finish , rate


    ! N = no of random poins , larger N better approximations
    call random_number (x)
    x = x * 4  ! x value ranges from o to 4
    call random_number (y)
    y = y * 3 ! y value ranges from 0 to 3
    call random_number (z)
    z = z * 2 ! z value ranges from 0 to 2

    call cpu_time(start)
    !$omp parallel private(val, i)
    !$omp do reduction(+:f_sum, f_sq_sum)
    do i = 1, N
        val = func(x(i), y(i), z(i))
        f_sum = f_sum + val
        f_sq_sum = f_sq_sum + val ** 2
    end do
    !$omp end do
    !$omp end parallel
    call cpu_time(finish)



    f_avg = f_sum / N
    f_sq_avg = f_sq_sum / N
    f_rms = sqrt((f_sq_avg - f_avg **2)/N)

    vol = 4.0d0 * 3.0d0 * 2.0d0

    print * ,"INTEGRAL = ", vol * f_avg , "+/-"  &
    & , f_rms * vol ,"time ", (finish - start) * 1000, "ms"


    contains
    function func(x, y, z) result(val)
        real(8) :: x, y , z
        real(8) :: val
        val = 4 * x ** 3 + x * y ** 2 + 5 * y + y * z + 6 * z
    end
end program 
