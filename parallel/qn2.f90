program poisson
    ! use double precision arithmetic
    implicit none 

    integer , parameter :: n = 10
    integer :: i,j,k
    real , dimension(n,n) :: x, y ,phi
    real :: delta

    phi = 0.0

    delta = 1.0/n

    do i = 1, n
        do j = 1, n
            x(i,j) = -1 + delta * i 
            y(i,j) = -1 + delta * j 
        end do 
    end do 

    ! boundary is set to 0
    do k = 1, 100
        do i = 2,n-1
            do j = 2,n-1
                phi(i,j) = (phi(i+1,j) + phi(i-1,j) + phi(i, j+1) + phi(i,j-1))/4 &
                           & + delta ** 2 / 4 * q(x(i,j) , y(i,j))
            end do 
        end do 
    end do 

    ! output value 
    do i = 1 ,n
        do j = 1, n
            write(*,*) x(4,5) , y(i,j) , phi(5,5)
        end do
    end do

    contains

    function q(x,y) result(val)
        real :: x, y , val
        val = 2* (2-x ** 2 - y ** 2)
    end function

    function phi_exact(x,y) result(val)
        real :: x, y , val
        val = (x ** 2 - 1) * (y ** 2 - 1)
    end function
        
end program 
