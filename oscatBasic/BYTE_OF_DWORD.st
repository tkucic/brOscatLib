FUNCTION BYTE_OF_DWORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=216*)
    BYTE_OF_DWORD := DWORD_TO_BYTE(SHR(IN,SHL(N,3)));

    (* revision history
    hm	17. jan 2007	rev 1.0
    	original version

    hm	2. jan 2008		rev 1.1
    	improved performance

    hm	30. oct. 2008	rev 1.2
    	improved performance
    *)


END_FUNCTION
