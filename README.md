network_light-harvesting
========================

My network research in theoretical light-harvesting
The duration of this study spanned from Feb 2013 to Jul 2013, by Tzu-Chi Yen, under the supervision of Professor Yuan-Chung Cheng.

The package component
========================
* [code-network] code for calculating the quantum yield and excitation lifetime of random networks

[code-network]
========================
* MAIN:
  * box_properness.m (draw the pairwose distribution function for different geometry) 
  * DipoleCoupling.m
  * FRate.m
  * rateM.m
  * whatsDE_rand.m

* CONFIGURATION GENERATION:
  * realn_box_p2.m
  * realn_box_p6.m
  * realn_sphere.m

* QY CALAULATION:
  * rate_box.m
  * rate_ps_1.m
  * rate_ps_1_rand.m (ploting with randomized energy configuration for PSI)
  * rate_box_rand.m (ploting with randomized energy for 5 highest/lowest QY configuration for random network with box geometry)

* MINOR CODES:
  * drawbox_ps1.tcl (code to draw the box of figure-1 in VMD)
  * rate_ps1_p6_pert (code to randomly shuffle dipole orientation in PSI stucture, except the central 6 chromophores remain fixed)
  * plot_fig_2b_ps1.m (for plotting figure-2b)
  * plot_fig_2b.m (for plotting figure-2b)
