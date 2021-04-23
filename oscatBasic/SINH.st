FUNCTION SINH
<<<<<<< HEAD:oscatBasic/SINH.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=67*)
    IF ABS(x) < 2E-3 THEN
=======
    IF ABS(X) < 2E-3 THEN
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/SINH.st
    	SINH := X;
    ELSE
    	SINH := (EXP(X) - EXP(-X)) * 0.5;
    END_IF


    (* revision history
    hm	12.1.2007	rev 1.0
    	original version

    hm	1.12.2007	rev 1.1
    	changed code to improve performance

    hm	5. jan 2008	rev 1.2
    	further performance improvement

    hm	11. mar 2008	rev 1.3
    	improved accuracy around 0

    *)
END_FUNCTION
