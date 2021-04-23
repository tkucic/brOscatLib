FUNCTION RDM2
<<<<<<< HEAD:oscatBasic/RDM2.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=62*)
    RDM2 := DINT_TO_INT(TRUNC(RDM(FRACT(LAST * math.PI)) * (HIGH - LOW + 1)) + LOW);
=======
    RDM2 := DINT_TO_INT(TRUNC(RDM(FRACT(last * PI)) * (high - low + 1)) + low);
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/RDM2.st

    (* revision history
    hm		29. feb 2008		rev 1.0
    	original version

    hm		18. oct. 2008		rev 1.1
    	using math constants

    *)
END_FUNCTION
