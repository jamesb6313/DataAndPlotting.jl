using Test
using DataAndPlotting

filename ="array.h5"
arr = init()

#will not overwrite existing file, therefore remove file first
rm("C:/Julia/DataAndPlotting.jl/tmp/array.h5", force=true)

output(arr, "C:/Julia/DataAndPlotting.jl/tmp/array.h5")
# for windows try - output(arr, "/temp/array.h5")

arr2 = input("C:/Julia/DataAndPlotting.jl/tmp/array.h5")
@test isequal(arr2, arr)

plotname = "wave.png"		#gets put in current directory "C:/Julia/DataAndPlotting.jl/test"
makeplot(arr, plotname)

