# set output format
set terminal pngcairo
set pm3d map

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
set output './results/B_strength.png'
splot "./results/B.csv" every ::1 u 1:2:(sqrt($3**2+$4**2))
