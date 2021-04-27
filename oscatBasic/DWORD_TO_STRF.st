FUNCTION DWORD_TO_STRF
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=154*)
    (* limit N to max 20 characters *)
    (* convert dword to string first and cut to length N *)
    temp := DWORD_TO_STRING(IN);
    FIX(temp,LIMIT(0,N,20),48,1, RETVAL);
    DWORD_TO_STRF := TRUE;

    (* revision history
    hm	26. jan.2007	rev 1.0		
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(20)
    	limit the output string to max 20 digits
    *)

END_FUNCTION
