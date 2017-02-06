using Base.Test, CSoM

data = Dict(
  # Solid(ndim, nst, nxe, nye, nze, nip, direction=:r, finite_element(nod, nodof))
  :struc_el => Solid(3, 6, 1, 3, 2, 8, Hexahedron(20, 3)),
  :properties => [
    100.0 0.3;
     50.0 0.3
     ],
  :etype => [1, 2, 1, 2, 1, 2],
  :x_coords => [0.0, 0.5],
  :y_coords => [0.0, 1.0, 2.0, 3.0],
  :z_coords => [0.0, -1.0, -2.0],
  :support => [
    ( 1, [0 0 1]), ( 2, [1 0 1]), ( 3, [1 0 1]), ( 4, [0 0 1]), ( 5, [1 0 1]), ( 6, [0 0 1]),
    ( 7, [1 0 1]), ( 8, [1 0 1]), ( 9, [0 0 1]), (10, [1 0 1]), (11, [0 0 0]), (12, [0 0 0]),
    (13, [0 0 0]), (14, [0 1 1]), (16, [0 1 1]), (18, [0 0 0]), (19, [0 0 0]), (20, [0 1 1]),
    (23, [0 1 1]), (25, [0 1 1]), (28, [0 1 1]), (30, [0 0 0]), (31, [0 0 0]), (32, [0 0 0]),
    (33, [0 1 1]), (35, [0 1 1]), (37, [0 0 0]), (38, [0 0 0]), (39, [0 1 1]), (42, [0 1 1]),
    (44, [0 1 1]), (47, [0 1 1]), (49, [0 0 0]), (50, [0 0 0]), (51, [0 0 0]), (52, [0 1 1]),
    (54, [0 1 1]), (56, [0 0 0]), (57, [0 0 0]), (58, [0 1 1]), (61, [0 1 1]), (63, [0 1 1]),
    (66, [0 1 1]), (68, [0 0 0]), (69, [0 0 0]), (70, [0 0 0])
    ],
  :loaded_nodes => [
    ( 1, [0.0 0.0  0.0417]), ( 2, [0.0 0.0 -0.1667]), ( 3, [0.0 0.0 0.0417]),
    (14, [0.0 0.0 -0.1667]), (15, [0.0 0.0 -0.1667]), (20, [0.0 0.0 0.0417]),
    (21, [0.0 0.0 -0.1667]), (22, [0.0 0.0  0.0417])
    ],
  :cg_tol => 1.0e-6,
  :cg_limit => 200
)

@time m = FE5_6(data)

@test round(m.loads, 6) == round([0.0,-0.02246346694279871,0.0015834980536394581,
  -0.02255392342226567,0.0032200096248063393,-0.023330744678156122,
  -0.018490421501239918,0.0015436552572527184,-0.018837579744487073,
  -0.014426584013959036,0.000758108774935321,-0.014352834013384995,
  0.001510754780516414,-0.014107617897569728,-0.006163718245800503,
  0.0027917408423724453,-0.00642963384915309,-0.0026366135718243313,
  -0.02091498326947445,0.0026816718481188196,-0.0023516812346939834,
  -0.021566782814254153,0.001920884753377238,-0.012580005831755597,
  0.0014015777022988452,0.002013339871061607,-0.012289746027600577,
  -0.0044049876644410456,-0.013659657429271048,0.0006192517064610159,
  -0.004364684658663649,-0.013682635615553444,0.0012803206718702447,
  -0.003937213170780445,-0.013865106854480258,0.0010781714472204325,
  -0.01150368487253231,0.0008754304129301573,0.0014902183736695519,
  -0.011520079385259393,0.002958298550745587,-0.009172157385921425,
  0.0005428175750394844,0.0029657695036362642,-0.009093552282121145,
  0.001086790841990653,0.003083946137593868,-0.00886438437543236,
  0.0023756711579008658,-0.004184290970072873,0.0020000081514032876,
  0.0026322766596393534,-0.004380326518923325,-0.003580029453345397,
  -0.005979378444251322,-7.434255665716828e-5,-0.0033211626960138463,
  -0.005812862504090185,0.0031506502924162714,-0.005383004376139153,
  0.0007612052870449623,0.003312577450672501,-0.00510403753887475,
  -0.0021209630500461274,-0.002575638378370245,-0.00018164032449477085,
  -0.002066453335319598,-0.0025410702629041237,-0.0003530637401429721,
  -0.0021203268406641673,-0.0023377636980903365,0.0002687101648067042,
  -0.0024037919859698506,0.00010005741722657716,0.0003146294081695405,
  -0.002217981584355519,0.0026513518484108235,-0.0021331211160756894,
  0.00020821495221305772,0.002668810617933032,-0.0020803503535569852,
  0.0004197944125798299,0.002802419752090088,-0.001956535953991593,
  0.0022934104104882637,-0.0011304912607470383,0.000675203530265976,
  0.002510901754958598,-0.0011979032948897668,-0.0017122952815988343,
  -0.0005376280868145963,-9.194098412984266e-5,-0.0017194141562073839,
  -0.0004759227363915604,0.0020447084241257216,-0.00037066546041142443,
  8.502504367464984e-5,0.0021796991756613503,-0.0002926128691617165,
  -0.0017078011178124253,0.0014594184353921443,-3.5472375649076564e-5,
  -0.001701964156393572,0.001490872509513805,-7.23458690131568e-5,
  -0.0016700801158574404,0.0014518938595627423,0.0003922148835519279,
  0.0011366646834883333,-0.00014560804071404775,0.00048478459672768917,
  0.0011384279855131594,0.001667944013586371,0.0005260608384831861,
  -9.973574416194975e-5,0.0017002041525974606,0.000538872034411955,
  -0.0002110480111015671,0.0018256971667198578,0.0005433079407925716,
  0.0015720469984855244,-0.00010282258564824705,-7.44637106651128e-5,
  0.0017157465735842493,-5.846408478297862e-5], 6)