FUNCTION CEIL
<<<<<<< HEAD:oscatBasic/CEIL.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=43*)
    CEIL := REAL_TO_INT(x);
=======
    CEIL := REAL_TO_INT(X);
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/CEIL.st
    IF CEIL < X THEN
    	CEIL := CEIL + 1;
    END_IF


    (* revision history
    hm	7. feb. 2007	rev 1.0
    	original version

    hm	21. mar. 2008	rev 1.1
    	use REAL_TO_INT instead of trunc for compatibility reasons

    *)

END_FUNCTION
