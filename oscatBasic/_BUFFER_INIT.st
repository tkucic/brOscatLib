FUNCTION _BUFFER_INIT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=477*)
    (* this routine uses 32 bit access to gain speed *)
    (* first access bytes till pointer is aligned for 32 bit access *)
    temp := PT;
    end := temp + UINT_TO_DWORD(SIZE);
    end32 := end - 3;
    WHILE (PT < end) AND ((temp AND 16#00000003) > 0) DO
    	PT^ := INIT;
    	PT := PT + 1;
    	temp := temp + 1;
    END_WHILE
    (* pointer is aligned, now copy 32 bits at a time *)
    PTw := PT;
    temp := SHL(BYTE_TO_DWORD(INIT),24) OR SHL(BYTE_TO_DWORD(INIT),16) OR SHL(BYTE_TO_DWORD(INIT),8) OR BYTE_TO_DWORD(INIT);
    WHILE PTw < end32 DO
    	PTw^ := temp;
    	PTw := PTw + 4;
    END_WHILE
    (* copy the remaining bytes in byte mode *)
    PT := PTw;
    WHILE PT < end DO
    	PT^ := INIT;
    	PT := PT + 1;
    END_WHILE

    _BUFFER_INIT := TRUE;

    (* revision History
    hm 	5. mar. 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	added type conversion to avoid warnings under codesys 3.0
    	chaged type of input SIZE to uint.

    hm	31. oct. 2008	rev 1.2
    	corrected an error while routine would write outside of arrays

    *)
END_FUNCTION
