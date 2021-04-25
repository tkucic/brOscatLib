FUNCTION V3_PAR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=110*)
    V3_XPRO(A, B,temp);
    V3_PAR := V3_ABS(temp) = 0.0;



    (* revision history
    hm	11 dec 2007	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	changed syntax of real constants to 0.0

    *)
END_FUNCTION
