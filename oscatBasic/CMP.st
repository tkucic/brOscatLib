FUNCTION CMP
<<<<<<< HEAD:oscatBasic/CMP.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=44*)
    tmp := ABS(x);
=======
    tmp := ABS(X);
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/CMP.st
    IF tmp > 0.0 THEN
    	tmp := EXP10(INT_TO_REAL(FLOOR(LOG(tmp))-N+1));
    ELSE
    	tmp := EXP10(tmp);
    END_IF
    CMP := ABS(X - Y) < tmp;


    (* revision history
    hm	12. mar. 2008	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	added type conversion for compatibility reasons
    *)


END_FUNCTION
