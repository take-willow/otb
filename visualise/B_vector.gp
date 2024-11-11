# set output format
set terminal pngcairo

# set text
unset key 
set xlabel "{/Arial=25 x position [a.u.] }"
set ylabel "{/Arial=25 z position  [a.u.] }"

# set layout
set size ratio -1
set xrange [0:xmesh*dx]
set yrange [0:zmesh*dz]

# plot
set datafile separator ","
set output './results/B_vector.png'
plot "./results/B.csv" every ::1 w vectors
