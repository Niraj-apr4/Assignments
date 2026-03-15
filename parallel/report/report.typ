= QN : 1 -- Riemann Summations 
== serial 

time taken :   1.0719999999999998E-003 INTEGRAL =    2127.3904055871162     

== parallel 

 nthreads : 2 time taken :   7.4539999999999997E-003 INTEGRAL =    2127.3904055871176     

 nthreads : 4 time taken :   1.0883000000000000E-002 INTEGRAL =    2127.3904055871176     

 nthreads : 8 time taken :   5.1529999999999996E-003 INTEGRAL =    2127.3904055871176     

#image("threads_timing.png")
= QN : 1 -- Monte Carlo Method

== serial ==
 N =          100 INTEGRAL =    2108.4610198233872      +/-   184.56367000944721      time    4.0000000000000972E-003 ms

 N =         1000 INTEGRAL =    2043.6867138945172      +/-   58.889186717553692      time    1.8999999999999920E-002 ms

 N =        10000 INTEGRAL =    2037.3386738372242      +/-   18.300821687422797      time   0.13300000000000009      ms

 N =        10000 INTEGRAL =    2026.5401046875184      +/-   18.279808521050096      time   0.14599999999999985      ms

 N =       100000 INTEGRAL =    2044.2449720014970      +/-   5.8215882645441823      time    1.3390000000000000      ms

 N =      1000000 INTEGRAL =    2038.0144834717426      +/-   1.8393861558654478      time    13.481000000000000      ms

 N =     10000000 INTEGRAL =    2039.3311171795569      +/-  0.58170664311019360      time    131.35499999999999      ms

== parallel ==
*nthreads = 2*

 N =          100 INTEGRAL =    1852.2455711957582      +/-   168.70798094533396      time   0.12399999999999997      ms

 N =         1000 INTEGRAL =    2039.0513175805527      +/-   58.162322036680493      time   0.11399999999999995      ms

 N =         1000 INTEGRAL =    2004.1104869816136      +/-   58.018050127189866      time   0.11400000000000017      ms

 N =        10000 INTEGRAL =    2011.4402101209339      +/-   18.182198770234791      time   0.18400000000000014      ms

 N =       100000 INTEGRAL =    2032.0471481824816      +/-   5.8089757201551979      time    1.3119999999999998      ms

*nthreads = 4*

 N =          100 INTEGRAL =    2077.4633109637366      +/-   179.74184944164836      time   0.15600000000000011      ms

 N =         1000 INTEGRAL =    1955.2617270074206      +/-   56.808444532418832      time   0.16200000000000003      ms

 N =         1000 INTEGRAL =    2101.9213554166181      +/-   60.538199400304464      time   0.15299999999999991      ms

 N =        10000 INTEGRAL =    2054.2490325160479      +/-   18.502908147351164      time   0.22300000000000011      ms

 N =       100000 INTEGRAL =    2028.0345437203182      +/-   5.7935747014630703      time   0.87999999999999967      ms

*nthreads = 8*

 N =          100 INTEGRAL =    2311.9000991021162      +/-   194.27914907891721      time   0.15899999999999986      ms

 N =         1000 INTEGRAL =    2030.0240736453845      +/-   57.195661850541541      time   0.18100000000000016      ms

 N =        10000 INTEGRAL =    2038.9643897270339      +/-   18.342848505311569      time   0.22199999999999998      ms

 N =        10000 INTEGRAL =    2045.8338311042230      +/-   18.439449330627259      time   0.21900000000000000      ms

 N =       100000 INTEGRAL =    2036.5872651121808      +/-   5.8029821173976046      time    2.8860000000000006      ms

#image("montecarlo_comparison.png")
#set text(font: "STIX Two Text")

= Q NO 2 Poisson Equations 
$ Delta = Delta y = Delta x = 0.1$

Number of iteration required covergence with error less than
1% = 
Plot of numerical and analytical solution of phi using serial program
#image("output.png")

for verification that parallel and serial implementation give same
result graph at y = 0.5 slice ($Phi$ vs x) is plotted for both serial
and parallel program  

at y = 0.5 slice 
#image("compare.png" ,width: 50%)


The OMP_SET_NUM_THREAD is set to 8 using the following
environment variable

!sh
export OMP_SET_NUM_THREAD=8

#image("threads_timing.png")
 No of threads:           2 Time taken :   2.0265689999999998     

 No of threads:           4 Time taken :   2.5992540000000002     

 No of threads:           8 Time taken :   1.9967379999999999     

 No of threads:          16 Time taken :   2.4368750000000001     

#image("timing_comparison.png")
