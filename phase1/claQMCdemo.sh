#bash script for ./laQMCdemo.v4.2
#Created 08/12/2021 by Amanda Bowman
#To make executable:
#    $ chmod u+x claQMCdemo.sh
#To run:
#    $ bash claQMCdemo.sh -i <runs> -d <data> -t <time> -m <maxslice> -r <nref> -p <tau0> -n <noise>

#!/bin/bash

while getopts i:d:t:m:r:p:s:n: flag
do
	case "${flag}" in
		i) runs=${OPTARG};;
		d) data=${OPTARG};;
                t) time=${OPTARG};;
                m) maxslices=${OPTARG};;
                r) nref=${OPTARG};;
                p) t0=${OPTARG};;
                s) dt=${OPTARG};;
                n) noise=${OPTARG};;
	esac
done

inputfile="/Users/Mandy/Desktop/sdsu_stuff/research/lanczos/Johnson_code/${data}.dat"
outfilepath="/Users/Mandy/Desktop/sdsu_stuff/research/lanczos/Johnson_code/${data}/${time}/data/"

for ((run=1; run<=$runs; run++)); do
	
	outputfile="${data}_${time}_${maxslices}_${nref}_${dt}_${noise}_${run}"
	
	echo -e "$inputfile\n$maxslices\n$nref\n$t0\n$dt\n$noise\n$outfilepath\n$outputfile\n" | /Users/Mandy/Desktop/sdsu_stuff/research/lanczos/Johnson_code/claQMCdemo.v4
	
done
