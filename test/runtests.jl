using Test
using DataAndPlotting

filename ="array.h5"
arr = init()

#will not overwrite existing file, therefore remove file first
# should access file in current directory which is test - 
# therfore file would be C:/Julia/DataAndPlotting.jl/test/array.h5
rm("array.h5", force=true) 

output(arr, "array.h5")
# for windows try - output(arr, "/temp/array.h5")

arr2 = input("array.h5")
@test isequal(arr2, arr)

plotname = "wave.png"		#gets put in current directory "C:/Julia/DataAndPlotting.jl/test"
makeplot(arr, plotname)

