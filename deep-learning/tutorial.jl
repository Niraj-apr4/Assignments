using Flux
actual(x) = exp(-x^2)
x_train, x_test = hcat(0:5...), hcat(6:10...)
y_train, y_test = actual.(x_train), actual.(x_test)

# introduce some noise in training data 
y_train = y_train + randn(size(y_train))


# define loss function 
using Statistics
loss(model, x, y) = mean(abs2.(model(x) .- y));

using Flux: train!
# Gradient Descent optimizer
opt = Descent()
data = [(x_train, y_train)]

# two parameters basic linear regression 
predict = Dense(1 => 1)
println("Basic Linear regression ")
for epoch in 1:20
   train!(loss, predict, data, opt)
   @show loss(predict, x_train, y_train)
end
println("=== Basic Linear Regression complete ===")
println("reset the data")
data = [(x_train, y_train)]

# set the no of neurons
n = 20



# activation funciton relu
println("Activation function : relu")
model_relu = Chain(Dense(1 => n, relu), Dense(n => 1))
for epoch in 1:20
   train!(loss, model_relu, data, opt)
   @show loss(model_relu, x_train, y_train)
end
println("complete , resetting the data")

 
# activation funciton : sigmoid 
println("Activation function Sigmoid")
model_σ = Chain(Dense(1 => n, σ), Dense(n => 1))
for epoch in 1:20
   train!(loss, model_σ, data, opt)
   @show loss(model_σ, x_train, y_train)
end
println("complete, resetting the data")
data = [(x_train, y_train)]

