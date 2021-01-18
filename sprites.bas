0 rem =================================
1 rem sprite demo v1 by s0ren lund
2 rem based on code from an article
3 rem about sprites on c64brain.com.
4 rem the code was based on an example
5 rem from the commodore 64c personal
6 rem computer system guide.
7 rem see http://bit.ly/c64sprites
9 rem =================================

10 rem global variables ***************
20 dim px(4): rem sprites x coordinates
30 dim py(4): rem sprites y coordinates
40 s=12288: rem sprite data address
50 v=53248: rem vic-ii base address 

100 rem main program ******************
110 gosub 1000: rem init display
120 gosub 1100: rem print intro text
130 gosub 1200: rem sprite setup
140 sys 58692: rem clear screen
150 gosub 1400: rem move sprites
160 gosub 1500: rem place sprites
170 for i=0 to 1000: next
180 poke v+21,0: rem hide all sprites
190 end 

1000 rem sub: init display ************
1010 sys 58692: rem clear_screen
1020 poke 646,0: rem black text
1030 poke v+21,0: rem hide all sprites
1040 poke v+32,15: rem grey border
1050 poke v+33,1: rem white background
1060 for i=0 to 5
1070 poke v+10+i,0: rem set x/y coord.
1080 next
1090 return

1100 rem sub: print intro text
1110 c=peek(646): rem save text color
1120 print chr$(17): rem move down
1130 print " sprites demo";
1140 print chr$(17): rem move down
1150 poke 646,11 : rem dark grey text
1160 print " initializing..."
1170 poke 646,c: rem reset text color
1180 return

1200 rem sub: sprite setup ************
1210 gosub 1300: rem init sprite data 
1220 for i=0 to 3
1230 poke 2044+i,s/64: rem sprite data
1240 poke v+43+i,i*2: rem sprite color
1250 next
1260 poke v+23,0: rem no double height
1270 poke v+29,0: rem no double width
1280 poke v+21,240: rem enable sprites
1290 return

1300 rem sub: init sprite data ********
1310 for i=0 to 62: rem 21 x 3 bytes
1320 read b$: d=0
1330 for j=0 to 7
1340 if mid$(b$,8-j,1)="#" then d=d+2^j
1350 next
1360 poke s+i,d
1370 next
1380 return

1400 rem sub: move sprites ************
1405 pokev+16,0
1410 poke v+10,100: rem spr. 5 x coord.
1420 poke v+13,100: rem spr. 6 y coord.
1430 for z=0 to 255
1440 poke v+14,z: rem sprite 7 x coord.
1450 poke v+15,z: rem sprite 7 x coord.
1460 poke v+12,z: rem sprite 6 x coord.
1470 poke v+11,z: rem sprite 5 y coord.
1475 poke v+8,255-z
1476 poke v+9,255-z
1480 next
1490 return

1500 rem sub: place sprites ***********
1505 pokev+8,66:pokev+16,16
1506 pokev+9,229
1510 pokev+10,22
1520 pokev+11,49
1530 pokev+12,22
1540 pokev+13,229
1550 pokev+14,66:pokev+16,128+16
1560 pokev+15,49
1570 return

10000 rem sprite data *****************
10010 data ........,........,........
10020 data ........,.######.,........
10030 data .......#,########,#....... 
10040 data .....###,########,##......
10050 data ....####,........,####....
10060 data ...###..,........,..###...
10070 data ...##..#,##....##,#..##...
10080 data ...##.#.,........,.#.##...
10090 data ..##....,##....##,....##..
10100 data ..#.....,##....##,.....#..
10110 data ..#.....,........,.....#..
10120 data ..#.....,........,.....#..
10130 data ..#.....,.##..##.,.....#..
10140 data ...#....,..####...,....#..
10150 data ...#...#,........,#...#...
10160 data ....#...,#......#,...#....
10170 data ....#...,.######.,...#....
10180 data .....#..,........,..#.....
10190 data ......#.,........,.#......
10200 data .......#,#......#,#.......
10210 data ........,.######.,........
