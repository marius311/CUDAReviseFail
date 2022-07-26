write("src/CUDAReviseFail.jl", """
module CUDAReviseFail
greet() = println("Not revised")
end
""")

using Revise, CUDAReviseFail, CUDA
CUDAReviseFail.greet()
write("src/CUDAReviseFail.jl", """
module CUDAReviseFail
greet() = println("Revised")
end
""")
Revise.retry()
CUDAReviseFail.greet()