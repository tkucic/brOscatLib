FUNCTION BIT_OF_DWORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=213*)
    BIT_OF_DWORD := (SHR(IN,N) AND 16#00000001) > 0;


    (* old code used before rev 1.1
    temp := SHR(IN,n);
    Bit_of_Dword := temp.0;
    *)


    (* revision history
    hm	4. aug. 2006	rev 1.0
    	origINal version

    hm	29. feb 2008	rev 1.1
    	improved performance

    hm	6. jun. 2008	rev 1.2
    	changes type of INput N from byte to INt
    *)

END_FUNCTION
