#bash script for ./laQMCdemo.v4.2
#Created 08/12/2021 by Amanda Bowman
#To make executable:
#    $ chmod u+x laQMCdemo.sh
#To run:
#    $ bash laQMCdemo.sh -i <runs> -d <data> -t <time> -m <maxslice> -r <nref> -p <tau0> -n <noise>

#!/bin/bash

while getopts i:d:t:m:r:p:s:n: flag
do
	case "${flag}" in
		i) runs=${OPTARG};;
		d) data=${OPTARG};;
                t) time=${OPTARG};;
                m) maxslices=${OPTARG};;
                r) nref=${OPTARG};;
                p) tau0=${OPTARG};;
                s) dtau=${OPTARG};;
                n) noise=${OPTARG};;
	esac
done

inputfile="/Users/Mandy/Desktop/sdsu_stuff/research/lanczos/Johnson_code/${data}.dat"
outfilepath="/Users/Mandy/Desktop/sdsu_stuff/research/lanczos/Johnson_code/${data}/${time}/data/"

for ((run=1; run<=$runs; run++)); do

	outputfile="${data}_${time}_${maxslices}_${nref}_${dtau}_${noise}_${run}"
	
	echo -e "$inputfile\n$maxslices\n$nref\n$tau0\n$dtau\n$noise\n$outfilepath\n$outputfile\n" | /Users/Mandy/Desktop/sdsu_stuff/research/lanczos/Johnson_code/laQMCdemo.v4.2 
done
