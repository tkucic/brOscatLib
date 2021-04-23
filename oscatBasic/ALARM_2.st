FUNCTION_BLOCK ALARM_2
<<<<<<< HEAD:oscatBasic/ALARM_2.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=333*)
=======
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMeasure/ALARM_2.st
    tmp := X - HYS * 0.5;
    IF tmp > LO_1 THEN Q1_LO := FALSE; END_IF
    IF tmp > LO_2 THEN Q2_LO := FALSE; END_IF
    IF tmp > HI_1 THEN Q1_HI := TRUE; END_IF
    IF tmp > HI_2 THEN Q2_HI := TRUE; END_IF
    tmp := tmp + HYS;
    IF tmp < LO_1 THEN Q1_LO := TRUE; END_IF
    IF tmp < LO_2 THEN Q2_LO := TRUE; END_IF
    IF tmp < HI_1 THEN Q1_HI := FALSE; END_IF
    IF tmp < HI_2 THEN Q2_HI := FALSE; END_IF



    (* revision history
    hm	19. may. 2008		rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	improved code
    *)

END_FUNCTION_BLOCK
