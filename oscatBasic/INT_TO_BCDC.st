FUNCTION INT_TO_BCDC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=227*)
    INT_TO_BCDC := SHL(INT_TO_BYTE(IN / INT#10),4) OR INT_TO_BYTE(IN MOD INT#10);

    (* revision history
    hm	13.12.2007
    	original version

    hm	30.6.2008	rev 1.1
    	changed name INT_TO_BCD to INT_TO_BCDC to avoid collision with util.lib
    	corrected error IN code

    *)
END_FUNCTION
