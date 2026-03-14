program monte_carlo
    implicit none 

    ! variable declararions 
    integer, parameter :: N = 70
    real , dimension(N) :: x, y, z
    real :: val , f_sum = 0.0 , f_sq_sum = 0.0 , f_avg, f_sq_avg , f_rms , vol
    real :: ans
    integer :: i, j 


    ! N = no of random poins , larger N better approximations
    call random_number (x)
    x = x * 4  ! x value ranges from o to 4
    call random_number (y)
    y = y * 3 ! y value ranges from 0 to 3
    call random_number (z)
    z = z * 2 ! z value ranges from 0 to 2

    do i = 1 , N
        val = func(x(i), y(i), z(i))
        f_sum = f_sum + val
        f_sq_sum = f_sq_sum + val ** 2
    end do

    f_avg = f_sum / N
    f_sq_avg = f_sq_sum / N
    f_rms = (f_sq_avg - f_avg **2)/N

    vol = 4 * 3 * 2 
    
    ans = vol * f_avg + vol * f_rms

    print * , ans , f_avg , f_rms


    contains
    function func(x, y, z) result(val)
        real :: x, y , z
        real :: val
        val = 4 * x ** 3 + x * y ** 2 + 5 * y + y * z + 6 * z
    end
end program 
