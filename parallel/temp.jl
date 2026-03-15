using Pkg
Pkg.activate("/home/niraj/project/julia")

using CairoMakie , DelimitedFiles

fig = Figure()
data = readdlm("output.csv", ',')
x = data[:,1]
y = data[:,2]
phi = data[:,3]
phi_exact = data[:,4]

Colorbar(fig[1, 3])

ax1 = Axis(fig[1, 1], title = "phi_approx")
ax2 = Axis(fig[1, 2], title = "Phi_exact")

contour3d!(ax1, x, y, phi)
contour!(ax2, x, y, phi_exact)

fig
