set xmax 152.0096 
set ymax 162.0090
set zmax 90.9239

set xmin 49.6096
set ymin 78.4090
set zmin 62.3239

draw materials off
draw color black

draw line "$xmin $ymin $zmax" "$xmin $ymax $zmax"
draw line "$xmin $ymin $zmax" "$xmax $ymin $zmax"
draw line "$xmax $ymin $zmax" "$xmax $ymax $zmax"
draw line "$xmax $ymax $zmax" "$xmin $ymax $zmax"

draw line "$xmin $ymax $zmax" "$xmin $ymax $zmin"
draw line "$xmin $ymin $zmax" "$xmin $ymin $zmin"
draw line "$xmax $ymin $zmax" "$xmax $ymin $zmin"
draw line "$xmax $ymax $zmax" "$xmax $ymax $zmin"

draw line "$xmin $ymax $zmin" "$xmin $ymin $zmin"
draw line "$xmin $ymin $zmin" "$xmax $ymin $zmin"
draw line "$xmax $ymin $zmin" "$xmax $ymax $zmin"
draw line "$xmax $ymax $zmin" "$xmin $ymax $zmin"
