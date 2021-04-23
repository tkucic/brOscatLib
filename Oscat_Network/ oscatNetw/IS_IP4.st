FUNCTION IS_IP4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=78*)
    IS_IP4 := OSCAT_BASIC.COUNT_CHAR(str, 46) = 3;


    (* revision history
    hm	1. mar. 2008	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	new code

    *)
END_FUNCTION
