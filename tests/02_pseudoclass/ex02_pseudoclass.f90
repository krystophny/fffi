module class_Circle
  implicit none
  private
  public :: Circle, circle_area, circle_print, circle_alloc_member

  real(8) :: pi = 3.1415926535897931d0 ! Class-wide private constant

  type Circle
     real(8) :: radius
     complex(8), dimension(:), allocatable :: alloc_array
  end type Circle
contains
  function circle_area(self) result(area)
    type(Circle), intent(in) :: self
    real(8) :: area
    area = pi * self%radius**2
  end function circle_area

  subroutine circle_print(self)
    type(Circle), intent(in) :: self
    real(8) :: area
    area = circle_area(self)  ! Call the circle_area function
    print *, 'Circle: r = ', self%radius, ' area = ', area
  end subroutine circle_print


  subroutine circle_alloc_member(self)
    type(Circle), intent(inout) :: self
    allocate(self%alloc_array(5)) 
    self%alloc_array = (1d0, 2d0)
  end subroutine
   
end module class_Circle

program circle_test
  use class_Circle
  implicit none

  type(Circle) :: c     ! Declare a variable of type Circle.
  c = Circle(1.5)       ! Use the implicit constructor, radius = 1.5.
  call circle_print(c)  ! Call a class subroutine
end program circle_test
