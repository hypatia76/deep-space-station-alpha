10 print chr$(147);chr$(14)
20 print "Deep Space Station Alpha"
30 print
40 print "Your Mission"
50 print "Black-ops gig from Uncle Sam."
55 print "Solo. No backup. No press."
60 print "Board the dead station. Grab intel."
65 print
70 print "Then something HUGE latches onto"
75 print "your ship and starts ripping it apart!"
80 print "You dive into the Docking Bay."
85 print "Seal it. Or become space chow."
90 print
130 print "Commands:"
132 print "look, go n/s/e/w, inv"
134 print "get <item>, use <item>"
136 print "search <thing>, help, quit"
140 dim rn(6),rs(6),re(6),rw(6)
150 rem set all exits to -1
160 rn(0)=-1:rs(0)=-1:re(0)=-1:rw(0)=-1
170 rn(1)=-1:rs(1)=-1:re(1)=-1:rw(1)=-1
180 rn(2)=-1:rs(2)=-1:re(2)=-1:rw(2)=-1
190 rn(3)=-1:rs(3)=-1:re(3)=-1:rw(3)=-1
200 rn(4)=-1:rs(4)=-1:re(4)=-1:rw(4)=-1
210 rn(5)=-1:rs(5)=-1:re(5)=-1:rw(5)=-1
220 rn(6)=-1:rs(6)=-1:re(6)=-1:rw(6)=-1
230 rem wire the map
240 rn(0)=1
250 rs(1)=0:rw(1)=3:re(1)=2:rn(1)=6
260 rw(2)=1
270 re(3)=1:rw(3)=4:rs(3)=5
280 re(4)=3
290 rn(5)=3
300 rs(6)=1
310 rem state vars
320 l=0:k=0:cb=0:r=0:b=0:g=0:co=0:vo=0:fl=0:ds=0:cs=0:sg=0:inv$=""
330 gosub 2000
340 print
350 input ">";a$
355 if a$="" then 340
357 s$=a$:gosub 3200:a$=s$
359 if a$="" then 340
360 gosub 3400
370 rem blank handled above
380 p=0
390 for j=1 to len(a$)
400 if mid$(a$,j,1)=" " then p=j:j=len(a$)
410 next j
420 if p=0 then f$=a$:s$=""
430 if p<>0 then f$=left$(a$,p-1):s$=mid$(a$,p+1)
440 gosub 3200
450 rem allow single-letter directions
460 if s$="" and (f$="n" or f$="north") then f$="go":s$="n"
470 if s$="" and (f$="s" or f$="south") then f$="go":s$="s"
480 if s$="" and (f$="e" or f$="east") then f$="go":s$="e"
490 if s$="" and (f$="w" or f$="west") then f$="go":s$="w"
500 if f$="look" and s$="" then gosub 2000:goto 340
505 if f$="help" and s$="" then gosub 2350:goto 340
510 if f$="inv" and s$="" then gosub 2300:goto 340
520 if f$="quit" and s$="" then print "Game over.":end
530 if f$="get" then gosub 2400:goto 340
540 if f$="use" then gosub 2800:goto 340
550 if f$="search" then gosub 3000:goto 340
560 if f$="go" then gosub 2600:goto 340
570 print "I don't understand that."
580 goto 340
2000 print
2010 if l=0 then print "Docking Bay.":print "A derelict airlock chamber."
2020 if l=1 then print "Corridor.":print "A central hallway, silent and cold.":print "A battered sign hangs crooked on the wall."
2030 if l=2 then print "Control Room.":print "Dead consoles and cracked windows.":print "A sealed vault lies under debris on the far wall."
2035 if l=2 and cs=0 then print "A wall console is half-buried in wreckage."
2037 if l=2 and cs=1 then print "A raised debris shield seals the breach point."
2040 if l=3 then print "Laboratory.":print "Broken glass and old instruments."
2050 if l=4 then print "Storage.":print "Crates stacked in the dark."
2060 if l=5 then print "Escape Pod Bay.":print "The pod waits, barely powered."
2070 if l=6 then print "Living Quarters.":print "A footlocker, a desk, a bed, and a laptop clutter the place.":print "A ceiling vent rattles softly."
2080 if l=0 and ds=0 then print "Your ship is getting shredded outside."
2085 if l=0 and ds=0 then print "You need to seal the bay. Now."
2090 if l=0 then print "A wall console blinks beside the door."
2100 if l=0 and k=0 then print "You see a keycard here."
2110 if l=3 and cb=0 then print "You see a crowbar here."
2120 if l=2 and vo=1 then print "The vault hangs open."
2130 if l=2 and vo=1 and r=0 then print "You see a red crystal inside."
2140 if l=4 and co=0 then print "You see a sealed crate here."
2150 if l=4 and co=1 then print "An open crate sits here."
2160 if l=4 and co=1 and b=0 then print "You see a blue crystal inside."
2170 if l=6 and fl=0 then print "That footlocker is locked up tight."
2180 if l=6 and fl=1 then print "The footlocker is open."
2190 if l=6 and fl=1 and g=0 then print "You see a green crystal inside."
2200 d$=""
2210 if rn(l)<>-1 then d$=d$+"n "
2220 if rs(l)<>-1 then d$=d$+"s "
2230 if re(l)<>-1 then d$=d$+"e "
2240 if rw(l)<>-1 then d$=d$+"w "
2250 if d$="" then d$="none"
2260 print "Exits: ";d$
2270 return
2300 if inv$="" then print "You have nothing.":return
2310 print "You have ";inv$;"."
2320 return
2350 print "Commands:"
2352 print "look, go n/s/e/w, inv"
2354 print "get <item>, use <item>"
2356 print "search <thing>, help, quit"
2360 return
2400 if s$="" then print "Get what?":return
2410 ok=0:new$=""
2420 if s$="keycard" and l=0 and k=0 then k=1:ok=1:new$="keycard"
2430 if s$="crowbar" and l=3 and cb=0 then cb=1:ok=1:new$="crowbar"
2440 if s$="red crystal" and l=2 and vo=0 then print "It's inside the sealed vault. Use the crowbar." : return
2450 if s$="red crystal" and l=2 and vo=1 and r=0 then r=1:ok=1:new$="red crystal"
2460 if s$="blue crystal" and l=4 and co=0 then print "It's inside the sealed crate. Use the crowbar." : return
2470 if s$="blue crystal" and l=4 and co=1 and b=0 then b=1:ok=1:new$="blue crystal"
2480 if s$="green crystal" and l=6 and fl=0 then print "It's in that locked footlocker." : return
2490 if s$="green crystal" and l=6 and fl=1 and g=0 then g=1:ok=1:new$="green crystal"
2500 if ok=0 then gosub 2550:return
2510 if inv$="" then inv$=new$:goto 2530
2520 inv$=inv$+", "+new$
2530 print "You pick up the ";new$;"."
2540 return
2550 if s$="keycard" and k=1 then print "You already have the keycard.":return
2555 if s$="crowbar" and cb=1 then print "You already have the crowbar.":return
2560 if s$="red crystal" and r=1 then print "You already have the red crystal.":return
2565 if s$="blue crystal" and b=1 then print "You already have the blue crystal.":return
2570 if s$="green crystal" and g=1 then print "You already have the green crystal.":return
2575 print "You can't get that here.":return
2600 if s$="" then print "Go where?":return
2610 c$=left$(s$,1)
2620 if c$<>"n" and c$<>"s" and c$<>"e" and c$<>"w" then print "Use: go n/s/e/w.":return
2630 if l=0 and c$="n" and ds=0 then print "You bolt for the Corridor..." : print "Too late." : print "The creature rips you to pieces." : end
2640 nl=-1
2650 if c$="n" then nl=rn(l)
2660 if c$="s" then nl=rs(l)
2670 if c$="e" then nl=re(l)
2680 if c$="w" then nl=rw(l)
2690 if nl=-1 then print "You can't go that way.":return
2695 if l=2 and cs=0 and nl<>-1 and nl<>2 then print "You turn to leave..." : print "A shadow blots the doorway." : print "The alien grabs your neck and crushes you." : end
2700 if nl=2 and k=0 then print "The Control Room door is locked. You need the keycard." : return
2710 if nl=5 and (r+b+g<3) then print "The pod hatch won't open." : print "You need all three crystals." : return
2720 l=nl
2721 te=0
2722 if l=4 and sg=0 then sg=1:te=1:print :print "A tentacle whips down from the ceiling!"
2723 if te=1 and cb=0 then print "No crowbar. Bad call." : print "It wraps you up and snaps you in half." : end
2724 if te=1 and cb=1 then print "You swing the crowbar and drive it back."
2730 gosub 2000
2740 if l=5 then print "You win!":end
2750 return
2800 if s$="" then print "Use what?":return
2810 if s$="console" and l=0 then goto 2900
2812 if s$="console" and l=2 then goto 3850
2814 if s$="console" then print "There's no console worth using here.":return
2820 if s$<>"crowbar" then print "You can't use that.":return
2830 if cb=0 then print "You don't have the crowbar.":return
2840 if l=4 and co=0 then co=1:print "You pry the crate open with the crowbar." : gosub 2000 : return
2850 if l=2 and vo=0 then vo=1:print "You wedge the crowbar into the vault and force it open." : gosub 2000 : return
2860 if l=4 and co=1 then print "The crate is already open.":return
2870 if l=2 and vo=1 then print "The vault is already open.":return
2880 print "There's nothing to use it on here.":return
2900 rem use console (docking bay only)
2910 if l<>0 then print "There's no console worth using here.":return
2920 if ds=1 then print "The Docking Bay is already sealed.":return
2930 if k=0 then print "The console demands a keycard swipe first." : return
2940 print "SEAL DOCKING BAY? (Y/N)"
2942 print "Press Y or N."
2944 gosub 3700
2946 if yn=2 then print "You hesitate." : print "The creature tears through." : print "You are dead." : end
2948 if yn<>1 then goto 2942
2990 ds=1:print "The doors slam shut. The station groans."
2995 rem urgency header removed
2996 print : print "The U.S. Government isn't paying you enough for this!"
2997 print "Get to the Corridor and search the sign for Escape Pod instructions."
2998 return
3000 rem search action
3010 if s$="" then print "Search what?":return
3020 if l=1 and s$="sign" then print "The sign reads:" : print "ESCAPE POD ACTIVATION:" : print "- Acquire RED, BLUE, and GREEN crystals." : print "- Reach the Escape Pod Bay." : print "- The hatch will open when all three are secured." : return
3030 if l<>6 then print "You find nothing worth searching here.":return
3035 if l=6 and s$="vent" then print "You crane your neck up..." : print "A slick appendage shoots down." : print "Lights out." : end
3040 if s$="desk" then print "A crumpled note: 'Somethin' is movin' in the vents. Don't look up.'":return
3050 if s$="bed" then print "You find a journal under the mattress." : print "It roasts Johnson nonstop." : print "It says he typed his footlocker code: 69420." : return
3060 if s$="laptop" then print "Whoever owned this shoulda deleted their browser history... gross.":return
3070 if s$<>"footlocker" then print "Try: search footlocker, desk, laptop, bed, or vent.":return
3080 if fl=1 then goto 3120
3090 print "Enter code";:input fc
3100 if fc=69420 then fl=1:print "Click. The footlocker pops open." : gosub 2000 : return
3110 print "You hear an undelightful sound of an error code." : return
3120 print "The footlocker is open."
3130 if g=0 then print "A green crystal rests inside.":return
3135 print "It's empty.":return
3140 return
3200 rem trim leading/trailing spaces in s$
3210 if s$<>"" and left$(s$,1)=" " then s$=mid$(s$,2):goto 3210
3220 if s$<>"" and right$(s$,1)=" " then s$=left$(s$,len(s$)-1):goto 3220
3230 return
3400 rem normalize input to consistent letter codes
3410 b$=""
3420 for i=1 to len(a$)
3430 c=asc(mid$(a$,i,1))
3440 if c>96 and c<123 then c=c-32
3450 b$=b$+chr$(c)
3460 next i
3470 a$=b$
3480 return
3600 rem normalize yn$ (trim + uppercase)
3605 if yn$="" then return
3610 if left$(yn$,1)=" " then yn$=mid$(yn$,2):goto 3610
3615 if len(yn$)>0 and right$(yn$,1)=" " then yn$=left$(yn$,len(yn$)-1):goto 3615
3620 b$=""
3625 for i=1 to len(yn$)
3630 c=asc(mid$(yn$,i,1))
3635 if c>96 and c<123 then c=c-32
3640 b$=b$+chr$(c)
3645 next i
3650 yn$=b$
3655 return
3700 rem get Y/N key, return yn=1 yes, yn=2 no
3705 yn=0
3710 get ky$
3712 if ky$="" then goto 3710
3714 c=asc(ky$)
3716 if c=89 or c=121 then yn=1:return
3718 if c=78 or c=110 then yn=2:return
3720 goto 3710
3850 rem control room console: raise debris shield
3852 if cs=1 then print "The debris shield is already raised." : return
3854 print "RAISE DEBRIS SHIELD? (Y/N)"
3856 print "Press Y or N."
3858 gosub 3700
3860 if yn=2 then print "You back away from the console." : return
3862 if yn<>1 then goto 3856
3864 cs=1:print "Hydraulics howl as a metal shield rises."
3866 print "Something slams into it from the other side... hard."
3868 return
9999 end