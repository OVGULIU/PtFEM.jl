using Compat, Base.Test, CSoM

include(Pkg.dir("CSoM", "examples", "5 Elastic Solids", "FE5_1.jl"))

data = Dict(
  # Plane(ndim, nst, nxe, nye, nip, direction, finite_element(nod, nodof), axisymmetric)
  :element_type => Plane(2, 3, 2, 1, 12, :y, Triangle(15, 2), false),
  :properties => [1.0e5 0.2;],
  :x_coords => [0.0,  1.0,  6.0],
  :y_coords => [0.0,  -2.0],
  :support => [
    (1, [0 1]),
    (2, [0 1]),
    (3, [0 1]),
    (4, [0 1]),
    (5, [0 0]),
    (10, [0 0]),
    (15, [0 0]),
    (20, [0 0]),
    (25, [0 0]),
    (30, [0 0]),
    (35, [0 0]),
    (40, [0 0]),
    (41, [0 1]),
    (42, [0 1]),
    (43, [0 1]),
    (44, [0 1]),
    (45, [0 0])
    ],
  :loaded_nodes => [
    (1, [0.0 -7/90]),
    (6, [0.0 -16/45]),
    (11, [0.0 -2/15]),
    (16, [0.0 -16/45]),
    (21, [0.0 -7/90])
    ]
)

@time m = FE5_1(data)

@test_approx_eq_eps m.loads[1:10] [0.0,-1.5912198206764464e-5,-1.1580746207864741e-5,-7.225530531847905e-6,-3.3533531045918466e-6,-9.31933942793864e-7,-1.559031671692096e-5,1.4927888685769456e-7,-1.1275746358774959e-5,4.539223317246215e-7] eps()