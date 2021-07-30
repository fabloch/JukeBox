EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Shield Pour JukeBox Arduino "
Date "2021-07-12"
Rev "1.0"
Comp "La Fabrique du Loch "
Comment1 "Réalisé par Alexandre Le Postollec "
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8950 1450 1    60   ~ 0
Vin
Text Label 9350 1450 1    60   ~ 0
IOREF
Text Label 8900 2500 0    60   ~ 0
A0
Text Label 8900 2600 0    60   ~ 0
A1
Text Label 8900 2700 0    60   ~ 0
A2
Text Label 8900 2800 0    60   ~ 0
A3
Text Label 8900 2900 0    60   ~ 0
A4(SDA)
Text Label 8900 3000 0    60   ~ 0
A5(SCL)
Text Label 10550 3000 0    60   ~ 0
0(Rx)
Text Label 10550 2800 0    60   ~ 0
2
Text Label 10550 2900 0    60   ~ 0
1(Tx)
Text Label 10550 2700 0    60   ~ 0
D3(**)
Text Label 10550 2600 0    60   ~ 0
D4
Text Label 10550 2500 0    60   ~ 0
5(**)
Text Label 10550 2400 0    60   ~ 0
6(**)
Text Label 10550 2300 0    60   ~ 0
7
Text Label 10550 2100 0    60   ~ 0
8
Text Label 10550 2000 0    60   ~ 0
9(**)
Text Label 10550 1900 0    60   ~ 0
10(**/SS)
Text Label 10550 1800 0    60   ~ 0
11(**/MOSI)
Text Label 10550 1700 0    60   ~ 0
12(MISO)
Text Label 10550 1600 0    60   ~ 0
13(SCK)
Text Label 10550 1400 0    60   ~ 0
AREF
NoConn ~ 9400 1600
Text Label 10550 1300 0    60   ~ 0
A4(SDA)
Text Label 10550 1200 0    60   ~ 0
A5(SCL)
Text Notes 10850 1000 0    60   ~ 0
Holes
Text Notes 8550 750  0    51   ~ 0
Shield pour Arduino qui utilise\nla même disposition des broches\n comme la carte "Uno" Rev 3.
$Comp
L Connector_Generic:Conn_01x08 P1
U 1 1 56D70129
P 9600 1900
F 0 "P1" H 9600 2350 50  0000 C CNN
F 1 "Power" V 9700 1900 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9750 1900 20  0000 C CNN
F 3 "" H 9600 1900 50  0000 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
Text Label 8650 1800 0    60   ~ 0
Reset
$Comp
L power:+3.3V #PWR01
U 1 1 56D70538
P 9150 1450
F 0 "#PWR01" H 9150 1300 50  0001 C CNN
F 1 "+3.3V" V 9150 1700 50  0000 C CNN
F 2 "" H 9150 1450 50  0000 C CNN
F 3 "" H 9150 1450 50  0000 C CNN
	1    9150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 56D707BB
P 9050 1350
F 0 "#PWR02" H 9050 1200 50  0001 C CNN
F 1 "+5V" V 9050 1550 50  0000 C CNN
F 2 "" H 9050 1350 50  0000 C CNN
F 3 "" H 9050 1350 50  0000 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 56D70CC2
P 9300 3150
F 0 "#PWR03" H 9300 2900 50  0001 C CNN
F 1 "GND" H 9300 3000 50  0000 C CNN
F 2 "" H 9300 3150 50  0000 C CNN
F 3 "" H 9300 3150 50  0000 C CNN
	1    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 56D70CFF
P 10300 3150
F 0 "#PWR04" H 10300 2900 50  0001 C CNN
F 1 "GND" H 10300 3000 50  0000 C CNN
F 2 "" H 10300 3150 50  0000 C CNN
F 3 "" H 10300 3150 50  0000 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 56D70DD8
P 9600 2700
F 0 "P2" H 9600 2300 50  0000 C CNN
F 1 "Analog" V 9700 2700 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 9750 2750 20  0000 C CNN
F 3 "" H 9600 2700 50  0000 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D71177
P 10800 650
F 0 "P5" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10721 724 20  0000 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D71274
P 10900 650
F 0 "P6" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10900 650 20  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 56D712A8
P 11000 650
F 0 "P7" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 11000 650 20  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P8
U 1 1 56D712DB
P 11100 650
F 0 "P8" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11024 572 20  0000 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 56D7164F
P 10000 2600
F 0 "P4" H 10000 2100 50  0000 C CNN
F 1 "Digital" V 10100 2600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 10150 2550 20  0000 C CNN
F 3 "" H 10000 2600 50  0000 C CNN
	1    10000 2600
	-1   0    0    -1  
$EndComp
Wire Notes Line
	8525 825  9925 825 
Wire Notes Line
	9925 825  9925 475 
Wire Wire Line
	9350 1450 9350 1700
Wire Wire Line
	9350 1700 9400 1700
Wire Wire Line
	9400 1900 9150 1900
Wire Wire Line
	9400 2000 9050 2000
Wire Wire Line
	9400 2300 8950 2300
Wire Wire Line
	9400 2100 9300 2100
Wire Wire Line
	9400 2200 9300 2200
Connection ~ 9300 2200
Wire Wire Line
	8950 2300 8950 1450
Wire Wire Line
	9050 2000 9050 1350
Wire Wire Line
	9150 1900 9150 1450
Wire Wire Line
	9400 2500 8900 2500
Wire Wire Line
	9400 2600 8900 2600
Wire Wire Line
	9400 2700 8900 2700
Wire Wire Line
	9400 2800 8900 2800
Wire Wire Line
	9400 2900 8900 2900
Wire Wire Line
	9400 3000 8900 3000
$Comp
L Connector_Generic:Conn_01x10 P3
U 1 1 56D721E0
P 10000 1600
F 0 "P3" H 10000 2150 50  0000 C CNN
F 1 "Digital" V 10100 1600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 10150 1600 20  0000 C CNN
F 3 "" H 10000 1600 50  0000 C CNN
	1    10000 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10550 2100
Wire Wire Line
	10200 2000 10550 2000
Wire Wire Line
	10200 1900 10550 1900
Wire Wire Line
	10200 1800 10550 1800
Wire Wire Line
	10200 1700 10550 1700
Wire Wire Line
	10200 1600 10550 1600
Wire Wire Line
	10200 1400 10550 1400
Wire Wire Line
	10200 1300 10550 1300
Wire Wire Line
	10200 1200 10550 1200
Wire Wire Line
	10200 3000 10550 3000
Wire Wire Line
	10200 2900 10550 2900
Wire Wire Line
	10200 2800 10550 2800
Wire Wire Line
	10200 2700 10550 2700
Wire Wire Line
	10200 2600 10550 2600
Wire Wire Line
	10200 2500 10550 2500
Wire Wire Line
	10200 2400 10550 2400
Wire Wire Line
	10200 2300 10550 2300
Wire Wire Line
	10200 1500 10300 1500
Wire Wire Line
	10300 1500 10300 3150
Wire Wire Line
	9300 2100 9300 2200
Wire Wire Line
	9300 2200 9300 3150
Wire Notes Line
	8500 500  8500 3450
Wire Notes Line
	8500 3450 11200 3450
Wire Wire Line
	9400 1800 8650 1800
Text Notes 9700 1600 0    60   ~ 0
1
Wire Notes Line
	11200 1000 10700 1000
Wire Notes Line
	10700 1000 10700 500 
$Comp
L Device:R R1
U 1 1 60EB8924
P 2000 4750
F 0 "R1" H 2070 4796 50  0000 L CNN
F 1 "1K" H 2070 4705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 1930 4750 50  0001 C CNN
F 3 "~" H 2000 4750 50  0001 C CNN
	1    2000 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female Connecteur2
U 1 1 60EC2ADD
P 2050 1550
F 0 "Connecteur2" H 2078 1526 50  0000 L CNN
F 1 "Connecteur bouton poussoir 2 " H 2078 1435 50  0000 L CNN
F 2 "Connector_Molex:Molex_CLIK-Mate_502382-0470_1x04-1MP_P1.25mm_Vertical" H 2050 1550 50  0001 C CNN
F 3 "~" H 2050 1550 50  0001 C CNN
	1    2050 1550
	1    0    0    -1  
$EndComp
Wire Notes Line
	3250 2000 1000 2000
$Comp
L power:GND #PWR0101
U 1 1 60ECE0B7
P 1150 1300
F 0 "#PWR0101" H 1150 1050 50  0001 C CNN
F 1 "GND" H 1155 1127 50  0000 C CNN
F 2 "" H 1150 1300 50  0001 C CNN
F 3 "" H 1150 1300 50  0001 C CNN
	1    1150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1650 1500 1650
Wire Wire Line
	1500 1650 1500 1450
Wire Wire Line
	1150 1300 1500 1300
Connection ~ 1500 1300
Wire Wire Line
	1500 1300 1500 1100
Text Label 1650 1100 0    50   ~ 0
LED-
Wire Wire Line
	1500 1100 1850 1100
$Comp
L Connector:Conn_01x04_Female Connecteur1
U 1 1 60EC1438
P 2050 1000
F 0 "Connecteur1" H 2078 976 50  0000 L CNN
F 1 "Connecteur bouton poussoir 1" H 2078 885 50  0000 L CNN
F 2 "Connector_Molex:Molex_CLIK-Mate_502382-0470_1x04-1MP_P1.25mm_Vertical" H 2050 1000 50  0001 C CNN
F 3 "~" H 2050 1000 50  0001 C CNN
	1    2050 1000
	1    0    0    -1  
$EndComp
Text Label 1650 1650 0    50   ~ 0
LED-
$Comp
L power:+3.3V #PWR0102
U 1 1 60ED2DA3
P 1150 1750
F 0 "#PWR0102" H 1150 1600 50  0001 C CNN
F 1 "+3.3V" H 1165 1923 50  0000 C CNN
F 2 "" H 1150 1750 50  0001 C CNN
F 3 "" H 1150 1750 50  0001 C CNN
	1    1150 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1750 1550 1750
Wire Wire Line
	1550 1750 1550 1200
Wire Wire Line
	1550 1200 1850 1200
Connection ~ 1550 1750
Wire Wire Line
	1550 1750 1150 1750
Text Label 1650 1750 0    50   ~ 0
LED+
Text Label 1650 1200 0    50   ~ 0
LED+
Wire Wire Line
	1850 1450 1500 1450
Connection ~ 1500 1450
Wire Wire Line
	1500 1450 1500 1300
Wire Wire Line
	1850 900  1500 900 
Wire Wire Line
	1500 900  1500 1100
Connection ~ 1500 1100
Wire Wire Line
	1850 1000 1700 1000
Text Label 1650 1000 0    50   ~ 0
D3
Wire Wire Line
	1850 1550 1700 1550
Text Label 1650 1550 0    50   ~ 0
D4
Text Notes 1050 800  0    50   ~ 0
Connecteur pour les bouton poussoir cela comprend \nl'alimentation électrique des leds et les boutons poussoir \n
$Comp
L Connector_Generic:Conn_01x08 CO1
U 1 1 60EE05D1
P 2300 3000
F 0 "CO1" H 2300 3450 50  0000 C CNN
F 1 "Connecteur PUCE RFID" V 2400 3000 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 2450 3000 20  0001 C CNN
F 3 "" H 2300 3000 50  0000 C CNN
	1    2300 3000
	1    0    0    -1  
$EndComp
Text Notes 2200 2700 2    60   ~ 0
1
Text Label 1800 2700 0    50   ~ 0
10
Wire Wire Line
	1900 2700 2100 2700
Wire Wire Line
	2100 2800 1900 2800
Wire Wire Line
	2100 2900 1900 2900
Wire Wire Line
	1900 3000 2100 3000
Wire Wire Line
	2100 3300 1900 3300
Wire Wire Line
	2100 3400 1900 3400
Text Label 1800 2800 0    50   ~ 0
13
Text Label 1800 2900 0    50   ~ 0
11
Text Label 1800 3000 0    50   ~ 0
12
Text Label 1850 3300 0    50   ~ 0
8
$Comp
L power:GND #PWR0103
U 1 1 60EF9334
P 1750 3200
F 0 "#PWR0103" H 1750 2950 50  0001 C CNN
F 1 "GND" H 1755 3027 50  0000 C CNN
F 2 "" H 1750 3200 50  0001 C CNN
F 3 "" H 1750 3200 50  0001 C CNN
	1    1750 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3200 2100 3200
$Comp
L power:+3.3V #PWR0104
U 1 1 60EFD6A0
P 1750 3650
F 0 "#PWR0104" H 1750 3500 50  0001 C CNN
F 1 "+3.3V" H 1765 3823 50  0000 C CNN
F 2 "" H 1750 3650 50  0001 C CNN
F 3 "" H 1750 3650 50  0001 C CNN
	1    1750 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3400 1900 3650
Wire Wire Line
	1900 3650 1750 3650
Wire Notes Line
	1000 4100 3250 4100
Text Notes 1100 2300 0    50   ~ 0
Connecteur pour le lecteur de carte rfid \n(vérifier sur un des branchement que\n les connecteur sont bien conformes)\n
Wire Wire Line
	2000 4900 2000 4950
Wire Wire Line
	2000 4950 1700 4950
Text Label 1650 4950 0    50   ~ 0
6
Wire Wire Line
	2000 4600 2000 4500
Text Label 1900 4500 0    50   ~ 0
6R1k
Text Notes 1100 4250 0    50   ~ 0
Sortie 6 couplé à une résistance de 1k ohm \n
Wire Notes Line
	3250 5250 1000 5250
$Comp
L Device:R_POT PotentiomètreVOL+-1
U 1 1 60F1C169
P 1950 6000
F 0 "PotentiomètreVOL+-1" V 1835 6000 50  0000 C CNN
F 1 "10K" V 1744 6000 50  0000 C CNN
F 2 "Connector_Molex:Molex_CLIK-Mate_502382-0370_1x03-1MP_P1.25mm_Vertical" H 1950 6000 50  0001 C CNN
F 3 "~" H 1950 6000 50  0001 C CNN
	1    1950 6000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 60F1D61B
P 1300 6000
F 0 "#PWR0105" H 1300 5750 50  0001 C CNN
F 1 "GND" H 1305 5827 50  0000 C CNN
F 2 "" H 1300 6000 50  0001 C CNN
F 3 "" H 1300 6000 50  0001 C CNN
	1    1300 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 6000 1300 6000
Wire Wire Line
	1950 5850 1950 5700
Text Label 1900 5650 0    50   ~ 0
A0
Wire Wire Line
	2100 6000 2250 6000
Text Label 2350 6000 0    50   ~ 0
POT10K
Wire Notes Line
	3250 6400 1000 6400
Wire Notes Line
	1000 600  1000 6400
Text Notes 1100 5350 0    50   ~ 0
Potentiomètre de 10 k\n
$Comp
L KLOP:DFPLAYER_MINI LecteurdecarteSDampli1
U 1 1 60F2FD0D
P 5350 2400
F 0 "LecteurdecarteSDampli1" H 5350 3087 60  0000 C CNN
F 1 "DFPLAYER_MINI" H 5350 2981 60  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" H 5350 2400 60  0001 C CNN
F 3 "" H 5350 2400 60  0000 C CNN
	1    5350 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2050 4450 2050
Wire Wire Line
	4750 2150 4450 2150
Wire Wire Line
	4750 2250 4450 2250
Wire Wire Line
	4750 2350 4450 2350
Wire Wire Line
	4750 2450 4450 2450
Text Label 4150 2050 0    50   ~ 0
POT10K
Text Label 4250 2150 0    50   ~ 0
6R1K
Text Label 4350 2250 0    50   ~ 0
5
Text Label 4350 2350 0    50   ~ 0
S
Text Label 4250 2450 0    50   ~ 0
6R1K
Wire Notes Line
	1000 600  6250 600 
Wire Notes Line
	6250 2950 3250 2950
Wire Notes Line
	3250 600  3250 6400
Text Notes 3400 800  0    50   ~ 0
Lecteur de carte SD et ampli S repart\nvers la prise jack qui possèdent un interrupteur \n
$Comp
L Connector:AudioJack2_Switch J1
U 1 1 60F6AB4F
P 5150 3900
F 0 "J1" H 4970 4000 50  0000 R CNN
F 1 "AudioJack2_Switch" H 4970 3909 50  0000 R CNN
F 2 "" H 5150 4100 50  0001 C CNN
F 3 "~" H 5150 4100 50  0001 C CNN
	1    5150 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 3700 4600 3700
Wire Wire Line
	4950 3900 4600 3900
Wire Wire Line
	4950 4000 4600 4000
Text Label 4550 3700 0    50   ~ 0
S
Text Label 4300 3900 0    50   ~ 0
POT10K
$Comp
L power:GND #PWR0106
U 1 1 60F73DCA
P 4600 4000
F 0 "#PWR0106" H 4600 3750 50  0001 C CNN
F 1 "GND" H 4605 3827 50  0000 C CNN
F 2 "" H 4600 4000 50  0001 C CNN
F 3 "" H 4600 4000 50  0001 C CNN
	1    4600 4000
	1    0    0    -1  
$EndComp
Wire Notes Line
	6250 600  6250 4300
Wire Notes Line
	6250 4300 3250 4300
Text Notes 3350 3100 0    50   ~ 0
Audio Jack with switch 
$Comp
L power:+5V #PWR0107
U 1 1 60ED5984
P 2250 6000
F 0 "#PWR0107" H 2250 5850 50  0001 C CNN
F 1 "+5V" H 2265 6173 50  0000 C CNN
F 2 "" H 2250 6000 50  0001 C CNN
F 3 "" H 2250 6000 50  0001 C CNN
	1    2250 6000
	1    0    0    -1  
$EndComp
Connection ~ 2250 6000
Wire Wire Line
	2250 6000 2350 6000
$EndSCHEMATC
