FUNCTION ROUND
<<<<<<< HEAD:oscatBasic/ROUND.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=65*)
    X := setup.DECADES[LIMIT(0,N,8)];
    ROUND := DINT_TO_REAL(REAL_TO_DINT(IN * X)) / X;
=======
    X := cDecades[LIMIT(0,N,8)];
    ROUND := DINT_TO_REAL(REAL_TO_DINT(in * X)) / X;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/ROUND.st



    (* revision history
    hm	1. sep 2006	rev 1.0
    	origINal version

    hm	2. dec 2007	rev 1.1
    	changed code for better performance

    hm	8. jan 2008	rev 1.2
    	further improvement IN performance

    hm 11. mar. 2008	rev 1.3
    	corrected an error with negative numbers
    	use real_to_dINt INstead of trunc

    hm	16. mar 2008	rev 1.4
    	added type conversion to avoid warnINg under codesys 3.0

    hm	25. oct. 2008	rev 1.5
    	new code usINg global constants decades
    *)




END_FUNCTION
