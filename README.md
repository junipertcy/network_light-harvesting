network_light-harvesting
========================

My network research in theoretical light-harvesting
The duration of this study spanned from Feb 2013 to Jul 2013, by Tzu-Chi Yen, under the supervision of Professor Yuan-Chung Cheng.

The package consists of three parts:
    (i)	    [code-network] code for calculating the quantum yield and excitation lifetime of random networks
    (ii)    [configuration data] random networks and arragement/energy configurations
    (iii)   [figures] computation result

(i)
MAIN:
box_properness.m (draw the pairwose distribution function for different geometry) 
DipoleCoupling.m
FRate.m
rateM.m
whatsDE_rand.m

CONFIGURATION GENERATION:
realn_box_p2.m
realn_box_p6.m
realn_sphere.m

QY CALAULATION:
rate_box.m
rate_ps_1.m
rate_ps_1_rand.m (ploting with randomized energy configuration for PSI)
rate_box_rand.m (ploting with randomized energy for 5 highest/lowest QY configuration for random network with box geometry)

MINOR CODES:
drawbox_ps1.tcl (code to draw the box of figure-1 in VMD)
rate_ps1_p6_pert (code to randomly shuffle dipole orientation in PSI stucture, except the central 6 chromophores remain fixed)
plot_fig_2b_ps1.m (for plotting figure-2b)
plot_fig_2b.m (for plotting figure-2b)

(ii)
STUCTURE DATA:
1JB0_ver2_30-SEP-03.pdb (natural PSI stucture used in this study)
struc_n_energy_data
rand_ener_p2 (for plotting figure-2b)
realn_box_p2_maxN_204+2_realn_10000
realn_box_p6_maxN_200+6_realn_10000
realn_sphere_p2_maxN_204+2_realn_1000_radii_39
realn_sphere_p2_maxN_204+2_realn_1000_radii_45


OUTPUT:
o_ps1_disorder_0_En_realns_1 (PSI quantum-yield data with no disorder)
o_ps1_rand (PSI quantum-yield data with disorder of standard deviation varying from 100:100:500, unit: cm^-1)
o_ps1_dipole_shuffling (PSI quantum-yield data with randomly shuffled dipole orientations with no disorder)
o_box_p2_{1_20}_10000 (quantum-yield/configuration data for varying number of nodes from 16 to 206, 16:10:206, box geometry, number of configuraions = 10000)
o_box_p2_{9}_ener_1000_high (quantum-yield/randomized-energy for random configurations (N=96) ranking 1000 highest quantum yield when energy is set uniform)
o_box_p2_{9}_ener_1000_low (quantum-yield/randomized-energy for random configurations (N=96) ranking 1000 lowest quantum yield when energy is set uniform)
o_sphere_p2_{38}_1000 (quantum-yield/configuration data for varying number of nodes from 16 to 206, 16:10:206, sphere geometry (R=38), number of configuraions = 1000)
o_sphere_p2_{45}_1000 (quantum-yield/configuration data for varying number of nodes from 16 to 206, 16:10:206, sphere geometry (R=45), number of configuraions = 1000)
o_box_p6_{9}_10000_new (quantum-yield/configuration data for random configurations (N=96) with central 6 chromophores fixed as the natural structure when energy is set uniform, box geometry, number of configuraions = 10000)
o_box_p6_{9}_10000_p6_new (quantum-yield/configuration data for random configurations (N=96) with central 6 chromophores fixed as the natural structure when energy is set biased, box geometry, number of configuraions = 10000)

(iii) contained in the folder *figures*

** Important parameters used in generating the output
box size:
    x = [-51.2,+51.2]
    y = [-41.8,+41.8]
    z = [-14.3,+14.3]

linewidth: 
    185 cm^-1
reorganization energy:
    75 cm^-1
dipole strength:
    4.3653 Debye
 
