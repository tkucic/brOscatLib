FUNCTION MULTIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=130*)
    MULTIME := DWORD_TO_TIME(REAL_TO_DWORD(DWORD_TO_REAL(TIME_TO_DWORD(t))*M));

    (* revision history
    hm		2. oct 2006	rev 1.0
    	original version

    hm		14. mar 2008	rev 1.1
    	rounded the result after the last digit

    *)
END_FUNCTION
