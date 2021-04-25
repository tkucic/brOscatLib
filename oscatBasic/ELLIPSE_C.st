FUNCTION ELLIPSE_C
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=106*)
    ELLIPSE_C := cPI * (3.0 * (R1+R2) - SQRT((3.0 * R1 + R2) * (3.0 * R2 + R1)));

    (* revision histroy
    hm	16. oct 2007	rev 1.0
    	original version

    hm	18. oct. 2008	rev 1.1
    	using math constants

    hm	10. mar. 2009	rev 1.2
    	changed syntax of real constants to 0.0

    *)
END_FUNCTION
