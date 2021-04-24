FUNCTION ROUND
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=65*)
    X := setup.DECADES[LIMIT(0,N,8)];
    ROUND := DINT_TO_REAL(REAL_TO_DINT(IN * X)) / X;



    (* revision history
    hm	1. sep 2006	rev 1.0
    	original version

    hm	2. dec 2007	rev 1.1
    	changed code for better performance

    hm	8. jan 2008	rev 1.2
    	further improvement IN performance

    hm 11. mar. 2008	rev 1.3
    	corrected an error with negative numbers
    	use real_to_dint instead of trunc

    hm	16. mar 2008	rev 1.4
    	added type conversion to avoid warning under codesys 3.0

    hm	25. oct. 2008	rev 1.5
    	new code using global constants decades
    *)




END_FUNCTION
