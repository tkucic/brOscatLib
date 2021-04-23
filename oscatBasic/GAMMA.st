FUNCTION GAMMA
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=52*)
    IF x > 0.0 THEN
    	GAMMA := SQRT(math.PI2 / X) * EXPT(math.E_INV * (x + 1.0 / (12.0 * x - 0.1 / X)), X);
    END_IF


    (* the stirling formula is not very accurate for small values of X
    IF X >=0 THEN GAMMA := SQRT(math.PI2 * X) * EXPT(X / math.E, X); END_IF
    *)





    (* revision history
    hm	10.12.2007	rev 1.0
    	original version

    hm	18. oct. 2008	rev 1.1
    	using math constants

    hm	26. oct. 2008	rev 1.2
    	using new formula with better accuracy

    hm	10. mar. 2009	rev 1.3
    	real constants updated to new systax using dot

    *)
END_FUNCTION