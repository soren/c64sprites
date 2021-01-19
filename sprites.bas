0 rem =================================
1 rem sprite demo v1 by s0ren lund
2 rem inspired by an article about
3 rem sprites on c64brain.com. code in
4 rem the article was based on an code
5 rem from the commodore 64c personal
6 rem computer system guide.
7 rem see https://bit.ly/3qt4Y99
9 rem =================================

10 rem global variables ***************
20 dim px(4): rem sprites x coordinates
30 dim py(4): rem sprites y coordinates
40 dim xs(4): rem sprites x set hi bit
50 dim xc(4): rem sprites x clr hi bit
60 xs(0)=16:xs(1)=32:xs(2)=64:xs(3)=128
70 xc(0)=239:xc(1)=223:xc(2)=191:xc(3)=127
80 s=12288: rem sprite data address
90 v=53248: rem vic-ii base address

100 rem main program ******************
110 gosub 1000: rem init display
120 gosub 1100: rem print intro text
130 gosub 1200: rem sprite setup
140 sys 58692: rem clear screen
150 gosub 1600: rem init sprite pos.
160 gosub 1700: rem set sprite coords.
170 for ii=0 to 89
180 gosub 1400: rem move sprites diag.
190 gosub 1700: rem set sprite coords.
200 next
210 for ii=0 to 39
220 gosub 1500: rem move sprites horiz.
230 gosub 1700: rem set sprite coords.
240 next
250 for ii=0 to 500: next
260 b=128
270 for ii=0 to 3
280 poke v+23,b
290 for jj=0 to 30: next
300 poke v+21,peek(v+21)-b
310 b=b/2
320 for jj=0 to 100: next
330 next
340 end

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

1100 rem sub: print intro text ********
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

1400 rem sub: move sprites diagonally *
1410 px(0)=px(0)-1: py(0)=py(0)-1
1420 px(1)=px(1)+1: py(1)=py(1)+1
1430 px(2)=px(2)+1: py(2)=py(2)-1
1440 px(3)=px(3)-1: py(3)=py(3)+1
1450 return

1500 rem sub: move 2 sprites horiz. ***
1510 px(1)=px(1)+1
1520 px(3)=px(3)-1
1530 return

1600 rem sub: init sprite posistions **
1610 px(0)=322: py(0)=229
1620 px(1)= 22: py(1)= 49
1630 px(2)= 22: py(2)=229
1640 px(3)=322: py(3)= 49
1650 return

1700 rem sub: set sprite coords. ******
1710 for i=0 to 3
1720 xl=px(i) and 255
1730 if px(i)>255 then goto 1760
1740 pokev+16,peek(v+16) and xc(i)
1750 goto 1770
1760 pokev+16,peek(v+16) or xs(i)
1770 pokev+8+i*2,xl: pokev+9+i*2,py(i)
1780 next
1790 return

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
