@recipe function f(sol::DGSolution; tidx = size(sol.t,1), vars=nothing)
    xguide --> "x"
    yguide --> "u"
    labels = String[]
    for i in 1:size(sol.u[tidx],2)
      push!(labels,"u$i")
    end
    yvector = sol.u[tidx]
    if vars != nothing
      yvector = sol.u[tidx][:,vars]
      labels = labels[vars]
    end
    if typeof(labels) <: String
      label --> labels
    else
      label --> reshape(labels,1,length(labels))
    end
    @series begin
      seriestype  :=  :path
      sol.nodes, yvector
    end
end
