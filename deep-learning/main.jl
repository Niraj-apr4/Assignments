# functions required
using GLMakie

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
# lines!(t,app_y)
# display(current_fig())

# ![plot1](plot1.png)
# question no 2
 
using Flux, Statistics
using Flux: train! 

t_train = hcat(t)'
y_train = hcat(y_with_noise)'

predict = Dense(1 => 1)

loss(model, x, y) = mean(abs2.(model(x) .- y))


opt = Descent()
data = [(t_train,y_train)]

# for epoch in 1:20
#     train!(loss, predict, data, opt)
#     @show loss(predict , t_train, y_train)
# end
