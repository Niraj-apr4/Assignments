# functions required
using CairoMakie

# selecting the test function to be f(x) = exp(x) sin(x)
function test_fun(t)
    return exp(0.1t)*sin(t)
end

# the domain of function be [0,100]
t = range(0,11*pi,length=100)

# for training add noise epsilon ~ N(0,1) to output
y =  test_fun.(t)

y_with_noise = y +  randn(length(t))

lines(t,y,linestyle=:dash)
scatter!(t,y_with_noise , color= :tomato)
current_figure()

# Linear Regression
# Calculate coefficient
"""
   linear_coeff
   parameters : x,y
   output : array  
"""
function linear_coeff(x,y)
    return inv(x'*x)*x'*y
end

# calculate and plot 
app_y = linear_coeff(t,y_with_noise)*t
lines!(t,app_y)
current_figure()
