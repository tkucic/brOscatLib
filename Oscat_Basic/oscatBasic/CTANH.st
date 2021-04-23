FUNCTION CTANH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=92*)
    xi2 := 2.0 * x.im;
    xr2 := 2.0 * x.re;
    temp := 1.0 / (COSH(xr2) + COS(xi2));
    CTANH.re := temp * SINH(xr2);
    CTANH.im := temp * SIN(xi2);


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1	
    	new faster code

    *)
END_FUNCTION
