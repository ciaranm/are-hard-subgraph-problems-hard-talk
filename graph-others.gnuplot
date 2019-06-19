# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 9.5cm,6.5cm font '\scriptsize' preamble '\usepackage{microtype}\RequirePackage[tt=false, type1=true]{libertine}\RequirePackage[varqu]{zi4}\RequirePackage[libertine]{newtxmath}\RequirePackage[T1]{fontenc}'
set output "gen-graph-others.tex"

load "common.gnuplot"

set xlabel "Runtime (ms)"
set ylabel "Number of Instances Solved"
set xrange [1e0:1e6]
set logscale x
set format x '$10^{%T}$'
set yrange [0:14621]
set ytics add ('$14621$' 14621) add ('' 14000)
set key off

plot \
    "runtimes.data" u (cumx(vf2)):(cumy(vf2)) smooth cumulative w l ti 'VF2' at end ls 8, \
    "runtimes.data" u (cumx(ri)):(cumy(ri)) smooth cumulative w l ti '\raisebox{-0.05cm}{RI}' at end ls 5, \
    "runtimes.data" u (cumx(pathlad)):(cumy(pathlad)) smooth cumulative w l ti '\raisebox{-0.0cm}{PathLAD}' at end ls 6, \
    "runtimes.data" u (cumx(final)):(cumy(final)) smooth cumulative w l ti '\raisebox{0.20cm}{Glasgow}' at end ls 2
