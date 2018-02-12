# explicitly setup our main window

wm geometry  . 850x350+300+200
wm title  .   "AASR-DH "
# setup the frame stuff

destroy .myArea
set f [frame .myArea -borderwidth 5 -background blue]
pack $f -side top -expand true -fill both

# create a menubar

destroy .menubar
menu .menubar
. config -menu .menubar

#  create a pull down menu with a label 
set File2 [menu .menubar.mFile2]
.menubar add cascade -label "AASR "  -menu  .menubar.mFile2
set File3 [menu .menubar.mFile3]
.menubar add cascade -label "PerformanceEvaluation"  -menu  .menubar.mFile3

set close [menu .menubar.sFile]
.menubar add cascade -label Quit  -menu  .menubar.sFile

# add the menu item

$File2 add command -label Run_AASR-Data -command {exec ./ns aars.tcl &}
$File2 add command -label Run_Simulation -command {exec nam aars.nam &}
$File2 add command -label Run_TAASR-Data -command {exec ./ns taars.tcl &}
$File2 add command -label Run_Simulation -command {exec nam taars.nam &}


$File3 add command -label Packet_Received -command {exec xgraph APDR.tr  tAPDR.tr    -x "Time" -y "Packets"  -bg "white" -fg "blue" -t Packet_Received -lw 3 &}
$File3 add command -label Packet_Loss_ratio -command {exec xgraph Aloss.tr tAloss.tr -x "Time" -y "Packets" -bg "white" -fg "blue" -t Packet_Loss_ratio -lw 3 &}
$File3 add command -label Throughput -command {exec xgraph Athroughput.tr tAthroughput.tr -x "Time" -y "packet" -bg "white" -t Throughput -fg "blue" -lw 3 &}
$File3 add command -label DELAY -command {exec xgraph Adly.tr tAdly.tr -x "Time" -y "packet" -bg "white" -t DELAY -fg "blue" -lw 3 &}
$File3 add command -label Trustvalue -command {exec xgraph  trustvalue.tr -x "node" -y "Trustvalue" -bg "white" -t Trustvalue -fg "blue" -lw 3 &}


$close add command -label Quit -command exit
