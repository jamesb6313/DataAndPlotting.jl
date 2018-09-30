module DataAndPlotting

using HDF5
using Plots		#; pyplot() - default backend is gr()

# Wave params x & y directions
const ki = 3
const kj = 3

# define 20x30 array - used for storing standing waves
const ni = 300
const nj = 200
	
export init
function init()
	arr = zeros(Float64, ni, nj)
	for j in 1:nj, i in 1:ni
		x = index2coord(i, ni)
		y = index2coord(j, nj)
		arr[i, j] = sin(2pi*ki*x) * sin(2pi*kj*y)
	end
	arr
end

# i ranges from 1 to ni
# i - 1 ranges from 0 to ni - 1
# x ranges from 0 to 1
function index2coord(i, ni)
	@assert ni > 1
	@assert 1 <= i <= ni
	(i - 1) / (ni - 1)
end

#write data to file
export output
function output(arr::Array{Float64,2}, filename::String)
	h5write(filename, "data",arr)
end

export input
function input(filename::String)
	arr = h5read(filename, "data") #, (1:ni, 1:nj))
end

#Create Plots
export makeplot
function makeplot(arr::Array{Float64,2}, filename::String)
	heatmap(arr, clim=(-1.0, +1.0), color=:viridis)
	savefig(filename)
end


end # module
