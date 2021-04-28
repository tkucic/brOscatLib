FUNCTION ARRAY_SDV
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=79*)
    (* standard deviation is simply the square root of the variance *)

    ARRAY_SDV := SQRT(ARRAY_VAR(ADR(PT), SIZE));

    (* revision history
    hm 	1.4.2007		rev 1.0
    	function created

    hm	16. mar. 2008	rev 1.1
    	changed type of input SIZE to uint

    *)
END_FUNCTION
