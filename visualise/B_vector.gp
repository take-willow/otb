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
# 画像の可読性のためにベクトルの大きさを変えています
plot "./results/B.csv" every ((1>=zmesh/40) ? 1 : zmesh/40):((1>=xmesh/40) ? 1 : xmesh/40):1 u 1:2:((sqrt($3**2+$4**2)**(0.1))*$3*xmesh/(80*sqrt($3**2+$4**2))):((sqrt($3**2+$4**2)**(0.1))*$4*zmesh/(80*sqrt($3**2+$4**2))) w vectors
