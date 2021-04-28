FUNCTION _BUFFER_CLEAR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=477*)
    (* this routine uses 32 bit access to gain speed *)
    (* first access bytes till pointer is aligned for 32 bit access *)
    temp := ADR(PT);
    end := temp + SIZE;
    end32 := end - 3;
    WHILE (ADR(PT) < end) AND ((temp AND 16#00000003) > 0) DO
    	PT := 0;
    	PT ACCESS (ADR(PT) + 1);
    	temp := temp + 1;
    END_WHILE
    (* pointer is aligned, now copy 32 bits at a time *)
    ptw ACCESS ADR(PT);
    WHILE ADR(ptw) < end32 DO (* *)
    	ptw := 0;
    	ptw ACCESS (ADR(ptw) + 4);
    END_WHILE
    (* copy the remaining bytes in byte mode *)
    PT ACCESS ADR(ptw);
    WHILE ADR(PT) < end DO
    	PT := 0;
    	PT ACCESS (ADR(PT) + 1);
    END_WHILE

    _BUFFER_CLEAR := TRUE;

    (* revision History
    hm 	5. mar. 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	added type conversion to avoid warnings under codesys 30
    	chaged type of input SIZE to uint
    	deleted unused variable i

    hm	31. oct. 2008	rev 1.2
    	corrected an error while routine would write outside of arrays

    *)
END_FUNCTION
