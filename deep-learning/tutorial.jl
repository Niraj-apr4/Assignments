using Flux
using Plots
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

println("\n================ Q1: Linear Regression ================")
# two parameters basic linear regression 
predict = Dense(1 => 1)
println("Basic Linear regression ")
for epoch in 1:20
   train!(loss, predict, data, opt)
   @show loss(predict, x_train, y_train)
end
println("=== Basic Linear Regression complete ===")
 
# Plot for Q1
x_plot = collect(0:0.1:10)
y_true = actual.(x_plot)
y_pred_lr = predict(hcat(x_plot...))

plot(x_plot, y_true, label="True Function", lw=2)
scatter!(vec(x_train), vec(y_train), label="Training Data")
plot!(x_plot, vec(y_pred_lr), label="Linear Regression Prediction", lw=2)
savefig("Q1_linear_regression.png")
println("reset the data")
data = [(x_train, y_train)]

println("\n================ Q2: Feedforward Neural Network ================")
# activation function relu - trying multiple configurations
println("Activation function : relu (multiple configurations)")

configs = [10, 20, 50]  # different hidden layer sizes

for n_hidden in configs
    println("\nTraining model with ", n_hidden, " hidden neurons")
    
    model_relu = Chain(
        Dense(1 => n_hidden, relu),
        Dense(n_hidden => 1)
    )
    
    opt_relu = Descent()  # fresh optimizer for each model
    
    for epoch in 1:20
        train!(loss, model_relu, data, opt_relu)
    end
    
    println("Final training loss: ", loss(model_relu, x_train, y_train))
    y_pred_nn = model_relu(hcat(x_plot...))
    plot(x_plot, y_true, label="True Function", lw=2)
    scatter!(vec(x_train), vec(y_train), label="Training Data")
    plot!(x_plot, vec(y_pred_nn), label="NN with $(n_hidden) neurons", lw=2)
    savefig("Q2_nn_$(n_hidden).png")
end

println("complete , resetting the data")

 
println("\n================ Q3: Recurrent Neural Network ================")
# Recurrent Neural Network experiments
println("Recurrent Neural Network (RNN) configurations")

rnn_configs = [5, 10, 20]  # number of hidden units

# reshape data for RNN: (features, sequence_length, batch_size)
x_train_rnn = reshape(x_train, 1, :, 1)
y_train_rnn = reshape(y_train, 1, :, 1)

for hidden_size in rnn_configs
    println("\nTraining RNN with ", hidden_size, " hidden units")
    
    model_rnn = Chain(
        RNN(1 => hidden_size, tanh),
        Dense(hidden_size => 1)
    )
    
    opt_rnn = Descent()
    
    for epoch in 1:30
        Flux.reset!(model_rnn)
        train!( (m, x, y) -> mean(abs2.(m(x) .- y)), model_rnn, [(x_train_rnn, y_train_rnn)], opt_rnn)
    end
    
    Flux.reset!(model_rnn)
    final_loss = mean(abs2.(model_rnn(x_train_rnn) .- y_train_rnn))
    println("Final training loss: ", final_loss)
    Flux.reset!(model_rnn)
    x_plot_rnn = reshape(hcat(x_plot...), 1, :, 1)
    y_pred_rnn = model_rnn(x_plot_rnn)

    plot(x_plot, y_true, label="True Function", lw=2)
    scatter!(vec(x_train), vec(y_train), label="Training Data")
    plot!(x_plot, vec(y_pred_rnn), label="RNN with $(hidden_size) units", lw=2)
    savefig("Q3_rnn_$(hidden_size).png")
end

println("RNN experiments complete")

data = [(x_train, y_train)]
