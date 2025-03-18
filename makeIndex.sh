#!/bin/bash


# Run make_ndx
gmx make_ndx -f replicate1/replicate1.tpr -o index_replicate.ndx << EOD
r 22-42
name 18 TM1 
r 148-170
name 19 TM2 
r 177-197
name 20 TM3 
r 207-229
name 21 TM4 
r 233-256
name 22 TM5 
r 263-283
name 23 TM6 
r 348-368
name 24 TM7 
r 377-397
name 25 TM8 
r 403-423
name 26 TM9 
r 432-455
name 27 TM10 
r 465-488
name 28 TM11 
r 493-513
name 29 TM12 

18|19|20|21|22|23|24|25|26|27|28|29
name 30 TM_all

30 & 4
name 31 TM_all_Backbone

r 149 & 3
name 35 D149_CA

r 486 & 3
name 36 R486_CA

r 233 & 3
name 37 R233_CA

r 455 & 3
name 38 E455_CA

r 156 & 3
name 39 N156_CA

r 362 & 3
name 40 Q362_CA

r 226 & 3
name 41 E226_CA

r 462 & 3
name 42 R462_CA

r 37 & 3
name 43 V37_CA

r 366 & 3
name 44 L366_CA

r 361 & a OH
name 45 Y361_OH

13 & a N3
name 46 MET_N3

1 | 13
name 47 OCT1_MF8

r 1-515 & 4
name 48 oct1_bb_no_icd
q
EOD



