FUNCTION ARRAY_SDV
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=79*)
    (* standard deviation is simply the square root of the variance *)

    array_sdv := SQRT(array_var(pt, size));

    (* revision history
    hm 	1.4.2007		rev 1.0
    	function created

    hm	16. mar. 2008	rev 1.1
    	changed type of input size to uint

    *)
END_FUNCTION
