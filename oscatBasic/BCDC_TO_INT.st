FUNCTION BCDC_TO_INT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=210*)
    BCDC_TO_INT := (IN AND 16#0F) + (SHR(IN,4) * 10);

    (* revision history
    hm	13.12.2007	rev 1.0
    	origINal version

    hm	30.6.2008	rev 1.1
    	changed name BCD_TO_INT to BCDC_TO_INT to avoid collision with util.lib

    *)
END_FUNCTION