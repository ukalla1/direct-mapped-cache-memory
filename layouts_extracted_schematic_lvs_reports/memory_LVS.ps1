@(#)$CDS: LVS version 6.1.7-64b 09/27/2016 19:41 (sjfhw305) $

Command line: /afs/umbc.edu/software/cadence/installs/IC617/tools.lnx86/dfII/bin/64bit/LVS -dir /afs/umbc.edu/users/u/k/ukalla1/home/vlsi/LVS -l -s -t /afs/umbc.edu/users/u/k/ukalla1/home/vlsi/LVS/layout /afs/umbc.edu/users/u/k/ukalla1/home/vlsi/LVS/schematic
Like matching is enabled.
Net swapping is enabled.
Using terminal names as correspondence points.
Compiling Diva LVS rules...

    Net-list summary for /afs/umbc.edu/users/u/k/ukalla1/home/vlsi/LVS/layout/netlist
       count
        1344            nets
        32              terminals
        1824            pmos
        1824            nmos

    Net-list summary for /afs/umbc.edu/users/u/k/ukalla1/home/vlsi/LVS/schematic/netlist
       count
        1344            nets
        32              terminals
        1824            pmos
        1824            nmos


    Terminal correspondence points
    N1343     N29       column_select<0>
    N1338     N28       column_select<1>
    N1333     N27       column_select<2>
    N1329     N26       column_select<3>
    N1314     N1        gnd!
    N1316     N19       input<0>
    N1312     N20       input<1>
    N1340     N21       input<2>
    N1335     N22       input<3>
    N1331     N23       input<4>
    N1327     N24       input<5>
    N1324     N25       input<6>
    N1320     N31       input<7>
    N1341     N10       output<0>
    N1336     N11       output<1>
    N1332     N12       output<2>
    N1328     N13       output<3>
    N1325     N14       output<4>
    N1321     N15       output<5>
    N1318     N16       output<6>
    N1315     N17       output<7>
    N1342     N9        row_select<0>
    N1339     N8        row_select<1>
    N1334     N7        row_select<2>
    N1330     N6        row_select<3>
    N1326     N5        row_select<4>
    N1322     N4        row_select<5>
    N1319     N3        row_select<6>
    N1317     N2        row_select<7>
    N1337     N18       rs
    N1323     N0        vdd!
    N1313     N30       write_enable

Devices in the netlist but not in the rules:
        pcapacitor
Devices in the rules but not in the netlist:
        cap nfet pfet nmos4 pmos4

The net-lists match.

                             layout  schematic
                                instances
        un-matched              0       0      
        rewired                 0       0      
        size errors             0       0      
        pruned                  0       0      
        active                  3648    3648   
        total                   3648    3648   

                                  nets
        un-matched              0       0      
        merged                  0       0      
        pruned                  0       0      
        active                  1344    1344   
        total                   1344    1344   

                                terminals
        un-matched              0       0      
        matched but
        different type          0       0      
        total                   32      32     


Probe files from /afs/umbc.edu/users/u/k/ukalla1/home/vlsi/LVS/schematic

devbad.out:

netbad.out:

mergenet.out:

termbad.out:

prunenet.out:

prunedev.out:

audit.out:


Probe files from /afs/umbc.edu/users/u/k/ukalla1/home/vlsi/LVS/layout

devbad.out:

netbad.out:

mergenet.out:

termbad.out:

prunenet.out:

prunedev.out:

audit.out:
