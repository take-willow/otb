# calculate_conditionから必要なデータを抜き出す
xmesh=`grep 'xmesh' ./results/calculate_condition.dat | awk '{print $2}'`
zmesh=`grep 'zmesh' ./results/calculate_condition.dat | awk '{print $2}'`
dx=`grep 'dx' ./results/calculate_condition.dat | awk '{print $2}'`
dz=`grep 'dz' ./results/calculate_condition.dat | awk '{print $2}'`

gnuplot -e "xmesh='${xmesh}';zmesh='${zmesh}';dx='${dx}';dz='${dz}'" ./visualise/B_vector.gp
gnuplot -e "xmesh='${xmesh}';zmesh='${zmesh}';dx='${dx}';dz='${dz}'" ./visualise/B_strength.gp
