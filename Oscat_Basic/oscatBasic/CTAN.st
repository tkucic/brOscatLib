FUNCTION CTAN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=91*)
    xi2 := 2.0 * x.im;
    xr2 := 2.0 * x.re;
    temp := 1.0 / (COS(xr2) + COSH( xi2));
    CTAN.re := temp * SIN(xr2);
    CTAN.im := temp * SINH(xi2);


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    hm	10. mar 2009	rev 1.1
    	faster code
    *)
END_FUNCTION