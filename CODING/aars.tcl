#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     30                         ;# number of mobilenodes
set val(rp)     DSDV                       ;# routing protocol
set val(x)      1501                      ;# X dimension of topography
set val(y)          600                 ;# Y dimension of topography
set val(stop)   20.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open aars.tr w]
$ns trace-all $tracefile

set dis [open distance1.tr w]
$ns trace-all $dis

set route1 [open routetable1.tr w]
$ns trace-all $route1

set rt [open Routingtable1.tr w]
$ns trace-all $rt

set f1 [open APDR.tr w]
set f3 [open Aloss.tr w]
set f2 [open Adly.tr w]
set f4 [open Athroughput.tr w]

#Open the NAM trace file
set namfile [open aars.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#Create 30 nodes
set n(0) [$ns node]
$n(0) set X_ 205
$n(0) set Y_ 203
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 20
set n(1) [$ns node]
$n(1) set X_ 254
$n(1) set Y_ 352
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 20
set n(2) [$ns node]
$n(2) set X_ 507
$n(2) set Y_ 230
$n(2) set Z_ 0.0
$ns initial_node_pos $n(2) 20
set n(3) [$ns node]
$n(3) set X_ 320
$n(3) set Y_ 156
$n(3) set Z_ 0.0
$ns initial_node_pos $n(3) 20
set n(4) [$ns node]
$n(4) set X_ 357
$n(4) set Y_ 305
$n(4) set Z_ 0.0
$ns initial_node_pos $n(4) 20
set n(5) [$ns node]
$n(5) set X_ 399
$n(5) set Y_ 456
$n(5) set Z_ 0.0
$ns initial_node_pos $n(5) 20
set n(6) [$ns node]
$n(6) set X_ 294
$n(6) set Y_ 473
$n(6) set Z_ 0.0
$ns initial_node_pos $n(6) 20
set n(7) [$ns node]
$n(7) set X_ 467
$n(7) set Y_ 513
$n(7) set Z_ 0.0
$ns initial_node_pos $n(7) 20
set n(8) [$ns node]
$n(8) set X_ 528
$n(8) set Y_ 360
$n(8) set Z_ 0.0
$ns initial_node_pos $n(8) 20
set n(9) [$ns node]
$n(9) set X_ 645
$n(9) set Y_ 301
$n(9) set Z_ 0.0
$ns initial_node_pos $n(9) 20
set n(10) [$ns node]
$n(10) set X_ 607
$n(10) set Y_ 168
$n(10) set Z_ 0.0
$ns initial_node_pos $n(10) 20
set n(11) [$ns node]
$n(11) set X_ 529
$n(11) set Y_ 77
$n(11) set Z_ 0.0
$ns initial_node_pos $n(11) 20
set n(12) [$ns node]
$n(12) set X_ 377
$n(12) set Y_ 80
$n(12) set Z_ 0.0
$ns initial_node_pos $n(12) 20
set n(13) [$ns node]
$n(13) set X_ 426
$n(13) set Y_ 183
$n(13) set Z_ 0.0
$ns initial_node_pos $n(13) 20
set n(14) [$ns node]
$n(14) set X_ 296
$n(14) set Y_ 254
$n(14) set Z_ 0.0
$ns initial_node_pos $n(14) 20
set n(15) [$ns node]
$n(15) set X_ 430
$n(15) set Y_ 343
$n(15) set Z_ 0.0
$ns initial_node_pos $n(15) 20
set n(16) [$ns node]
$n(16) set X_ 541
$n(16) set Y_ 464
$n(16) set Z_ 0.0
$ns initial_node_pos $n(16) 20
set n(17) [$ns node]
$n(17) set X_ 645
$n(17) set Y_ 448
$n(17) set Z_ 0.0
$ns initial_node_pos $n(17) 20
set n(18) [$ns node]
$n(18) set X_ 717
$n(18) set Y_ 358
$n(18) set Z_ 0.0
$ns initial_node_pos $n(18) 20
set n(19) [$ns node]
$n(19) set X_ 757
$n(19) set Y_ 255
$n(19) set Z_ 0.0
$ns initial_node_pos $n(19) 20
set n(20) [$ns node]
$n(20) set X_ 788
$n(20) set Y_ 174
$n(20) set Z_ 0.0
$ns initial_node_pos $n(20) 20
set n(21) [$ns node]
$n(21) set X_ 665
$n(21) set Y_ 76
$n(21) set Z_ 0.0
$ns initial_node_pos $n(21) 20
set n(22) [$ns node]
$n(22) set X_ 831
$n(22) set Y_ 119
$n(22) set Z_ 0.0
$ns initial_node_pos $n(22) 20
set n(23) [$ns node]
$n(23) set X_ 848
$n(23) set Y_ 272
$n(23) set Z_ 0.0
$ns initial_node_pos $n(23) 20
set n(24) [$ns node]
$n(24) set X_ 804
$n(24) set Y_ 452
$n(24) set Z_ 0.0
$ns initial_node_pos $n(24) 20
set n(25) [$ns node]
$n(25) set X_ 699
$n(25) set Y_ 521
$n(25) set Z_ 0.0
$ns initial_node_pos $n(25) 20
set n(26) [$ns node]
$n(26) set X_ 806
$n(26) set Y_ 355
$n(26) set Z_ 0.0
$ns initial_node_pos $n(26) 20
set n(27) [$ns node]
$n(27) set X_ 881
$n(27) set Y_ 372
$n(27) set Z_ 0.0
$ns initial_node_pos $n(27) 20
set n(28) [$ns node]
$n(28) set X_ 700
$n(28) set Y_ 196
$n(28) set Z_ 0.0
$ns initial_node_pos $n(28) 20
set n(29) [$ns node]
$n(29) set X_ 919
$n(29) set Y_ 183
$n(29) set Z_ 0.0
$ns initial_node_pos $n(29) 20
 
 # define color to all nodes
 for {set i 0} {$i<$val(nn)} {incr i} {
 $n($i) color blue
 $ns at 0.0 "$n($i) color deepskyblue"
 }
 set hrate1 1
set hrate2 2
 puts -nonewline "Enter the source value 0 to 29 : "
 flush stdout
 gets stdin sor
 puts -nonewline "Enter the destination 0 to 29 : "
 flush stdout
 gets stdin dest
 puts -nonewline "Enter the session key: "
 flush stdout
 gets stdin ka
 puts -nonewline "Enter the data to encrypt: "
 flush stdout
 gets stdin ke1
 
  source scen
 #data routing cbr procedure
 
 proc attach-cbr-traffic { node sink size interval } {
	global ns
	set source [new Agent/UDP]
	$source set class_ 2
	$ns attach-agent $node $source
	set traffic [new Application/Traffic/CBR]
	$traffic set packetSize_ $size
	$traffic set interval_ $interval
	$traffic attach-agent $source
	$ns connect $source $sink
	return $traffic
}

 #distance calculation
 
 set nn 30
	for {set i 0} {$i<$nn} {incr i} { 
		set neighborlist($i) [list]
		set x_pos1 [$n($i) set X_]
		set y_pos1 [$n($i) set Y_]
		puts "Distance from node $i"
		puts "***************************************"
		puts $dis "**********************************"
		puts "FROM	TO	DISTANCE"
		puts $dis "FROM	TO	DISTANCE"
		puts "***************************************"
		puts $dis "**********************************"
 		for {set j 0} {$j<$nn} {incr j} {
			if {$j!=$i} {
			set x_pos2 [$n($j) set X_]
			set y_pos2 [$n($j) set Y_]
			set x_pos [expr $x_pos1-$x_pos2]
			set y_pos [expr $y_pos1-$y_pos2]
			set v [expr $x_pos*$x_pos + $y_pos*$y_pos]
			set d [expr sqrt($v)]
			set nd($i,$j) $d
			puts $dis "Node$i	Node$j 	$d"
			puts "Distance from $i to $j:$d"
			if {$d<220} {
				$n($i) add-neighbor $n($j)
			}
			}
		}
		set neighbor1 [$n($i) neighbors]
			foreach nb1 $neighbor1 {
			set now [$ns now]
    			puts "The neighbor for node $i are:$nb1"
			set idv [$nb1 id]
    			puts "$idv"
				lappend neighborlist($i) $idv
			}
		
	}
	
	#find route to nodes
set des 0
	puts $rt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts $rt "RouteFrom		RouteTo		Route"
	puts $rt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	for {set des 0} {$des<$val(nn)} {incr des} {
		for {set j 0} {$j<$val(nn)} {incr j} {
			if {$des!=$j} {
				set s $j
				set flag 0
				set RNc $s
				puts "Route from $j to $des"
				while {$RNc!=$des} {
					foreach rn $neighborlist($RNc) {
						puts "$rn"
						if {$rn==$des} {
							set flag 1
						}
					}
					if {$flag==1} {
						set RN1 $des
					} else {
						set x_pos1 [$n($des) set X_]
						set y_pos1 [$n($des) set Y_]
						set dL [list]
						foreach rnod $neighborlist($RNc) { 
							set x_pos2 [$n($rnod) set X_]
							set y_pos2 [$n($rnod) set Y_]
							set x_pos [expr $x_pos1-$x_pos2]
							set y_pos [expr $y_pos1-$y_pos2]
							set v [expr $x_pos*$x_pos + $y_pos*$y_pos]
							set D2 [expr sqrt($v)]
							lappend dL $D2	
						}
						set disl [lsort -real $dL]
						set mindis [lindex $disl 0]						
						for {set i 0} {$i<$val(nn)} {incr i} {
							if {$i!=$des} {
								if {$mindis==$nd($des,$i)} {
									set RN1 $i
								}
							}
						}
					}
					set RNc $RN1
					lappend route($j,$des) $RNc
					puts "$RNc"
				}
				puts $rt "$j			$des			$route($j,$des)"
				puts $route1 "$route($j,$des) $RNc j:$j des:$des"
			}
		}
	}	
	
	set am [open neigh.tr w ]
	
#group signature

	set encr [open encry.tr w]
	set null1 [new Agent/LossMonitor]
	set null2 [new Agent/LossMonitor]
	set null3 [new Agent/LossMonitor]
proc RREQ {} {
	global ns array names n route null1 am cor sor dest t  ka encr
	set sn $sor 
	set dn $dest 
	set s $sn
	set sink $dn
	set r 0
	set t [$ns now]
	$ns at [$ns now] "$n($s) add-mark mo blue"
	$ns at [$ns now] "$n($sink) add-mark mo green"
	$ns at [$ns now] "$n($s) label source"
	$ns at [$ns now] "$n($sink) label distination"
	$ns at $t "$ns trace-annotate \" The route from $s to $sink\""
	while {$s!=$sink} {
		set in [lindex $route($sn,$dn) $r]
		lappend div $in
		puts "in:$in"
		package require md4
		puts [md4::md4 -hex "$ka"]
		set b($r) [md4::md4 -hex "$ka"]
		puts  $encr "$b($r) is $r"
		$ns at $t "$ns trace-annotate \" $in \""
		$ns attach-agent $n($in) $null1
		# transPower $in
		set cbr01 [attach-cbr-traffic $n($s) $null1 100 0.010]
		$ns at $t "$cbr01 start"		
		$ns at $t "$ns trace-annotate \" the request msg $b($r) send from $s to $in \""
		$ns at [$ns now] "$n($in) add-mark mo yellow"
		$ns at [expr $t+1.0] "$cbr01 stop"
		set t [expr $t+1.1]
		set s $in
		set ka $b($r)
		incr r
		puts "r:$r"
	}
	puts "Time:$t"	
	puts $am  "$div"
	set length [llength $div]
	puts "$length"
	for {set i [expr $length-2]} {$i>=0} {incr i -1} {
	set rest [lindex $div $i]
	lappend result $rest 
	}
	set cor [linsert $result end $sn]
	puts $cor
	puts $am "$cor"
	$ns at [expr $t + 0.5] "RPLY"
	}
	# puts $t
	proc RPLY { } {
	global ns array names n route null2 am cor sor dest t ka encr
	set sn $dest  
	set dn $sor 
	set s $sn
	set sink $dn
	set r 0
	set t [$ns now]
	while {$s!=$sink} {
	set in [lindex $cor $r]
	lappend div $in
		puts "in:$in"
		package require md5
		puts [md5::md5 -hex "$ka"]
		set b($r) [md5::md5 -hex "$ka"]
		puts  $encr "$b($r) is $r"	
		$ns at $t "$ns trace-annotate \" $in \""
		$ns attach-agent $n($in) $null2
		set cbr01 [attach-cbr-traffic $n($s) $null2 150 0.010]
		$ns at $t "$cbr01 start"		
		$ns at $t "$ns trace-annotate \" reply msg $b($r) $s to $in \""
		$ns at [$ns now] "$n($in) add-mark mo yellow"
		$ns at [expr $t+1.0] "$cbr01 stop"
		set t [expr $t+1.1]
		set s $in
		set ka $b($r)
		incr r
		puts "r:$r"
		}		
		puts "Time:$t"
		$ns at [expr $t + 0.5]  "Transmission1"
	}
	
	proc Transmission1 {} {
	global array names n array names nd ns array names route null3 source sor dest snode ke1
	set sn $sor
	set dn $dest
	set s $sn
	set sink $dn
	set r 0
	set t [$ns now]
	$ns at [$ns now] "$n($s) label source"
	$ns at [$ns now] "$n($sn) add-mark mo blue"
	$ns at $t "$ns trace-annotate \" The route from $sn to sink\""
	while {$s!=$sink} {
		set in [lindex $route($sn,$dn) $r]
		puts "in:$in"
		$ns at $t "$ns trace-annotate \" $in \""
		package require sha1
		set kv1 [sha1::sha1 "$ke1"]
		$ns attach-agent $n($in) $null3
		set cbr01 [attach-cbr-traffic $n($s) $null3 300 0.008]
		$ns at $t "$cbr01 start"
		$ns at $t "$ns trace-annotate \" ENCRYPT Data $kv1 send $s to $in \""
		$ns at [$ns now] "$n($in) color red"
		$ns at [expr $t+1.0] "$cbr01 stop"
		set t [expr $t+1.1]
		set s $in
		incr r
		puts "r:$r"
			}
	puts "Time:$t"
	$ns at $t "$ns trace-annotate \" decrypt Data $ke1  \""
	$ns at [expr $t+1] "finish"
}
	
	proc record {} {
 #Get An Instance Of The Simulator
    set ns [Simulator instance]

  global  f1 f2 f3 f4 f15 f16 hrate1 hrate2 hrate3 hrate4 hrate5 pdrratio null1 null2 null3  dl 
     
   #Set The Time After Which The Procedure Should Be Called Again
   set time 0.05
   
   #How Many Bytes Have Been Received By The Traffic Sinks?
   set bw0 [$null1 set npkts_]
   set bw1 [$null2 set npkts_]
   set bw2 [$null3 set npkts_]   
   #packets Received by each node
     
   set totalpkts [expr $bw0+$bw1+$bw2]       
	set mean [expr $totalpkts/7]    
   set drop0 [$null1 set nlost_]
   set drop1 [$null2 set nlost_]
   set drop2 [$null3 set nlost_]  
   set totaldrop [expr ($drop1+$drop0+$drop2)/100]
   set loss [expr $bw2/3]
   # puts "Total packet drops : $totaldrop"
   set QOS [expr $totalpkts-$loss]
   set Size 64  
   set pdr1 [expr $bw1/$Size*10]

    
   
   set pdr0 [expr $bw0/$Size*10]
   set pdr2 [expr $bw2/$Size*10]	  

   set total [expr $pdr0+$pdr1+$pdr2+40]
   set pdrratio [expr $total/7] 
   set dly0 [expr (($bw0+$hrate1)*8)/(2*$time*1000)]
   set dly1 [expr (($bw1+$hrate2)*8)/(2*$time*1000)] 
   set dly2 [expr (($bw2+$hrate1)*8)/(2*$time*1000)]   
   set totaldelay [expr $dly0+$dly1+$dly2]

	#Get The Current Time
   set now [$ns now]
    #Save Data To The Files
   puts $f1 "$now [expr $totalpkts]"
   
   puts $f2 "$now [expr $totaldelay]"
   puts $f3 "$now [expr $loss]"
   
   puts $f4 "$now [expr $QOS]"
   #Re-Schedule The Procedure
   $ns at [expr $now+$time] "record"
  } 
#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam aars.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}

$ns at 0.0 "record"
$ns at 1.0 "RREQ"
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
