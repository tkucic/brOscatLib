FUNCTION BIT_COUNT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=210*)
    WHILE IN > 0 DO
    	IF IN.0 THEN Bit_Count := Bit_Count + 1; END_IF
    	IN := SHR(IN,1);
    END_WHILE



    (* revision history
    5.7.2007	rev 1.0		original version

    10.9.2007	rev 1.1		hm
    	changed algorithm for better performace
    	the execution time has reduced by a factor of 5
    	deleted unused variable temp
    *)
END_FUNCTION
