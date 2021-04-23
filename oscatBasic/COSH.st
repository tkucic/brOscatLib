FUNCTION COSH
<<<<<<< HEAD:oscatBasic/COSH.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=45*)
    T := EXP(X);
    COSH := (1.0 / T + T) * 0.5;
=======
    t := EXP(X);
    COSH := (1.0 / t + t) * 0.5;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/COSH.st

    (* revision histroy
    hm	12.1.2007	rev 1.0
    	original version

    hm	1.12.2007	rev 1.1
    	changed code to improve performance

    hm	5. jan 2008	rev 1.2
    	further performance improvement

    hm	10. mar. 2009	rev 1.3
    	real constants updated to new systax using dot
    *)
END_FUNCTION
