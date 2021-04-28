FUNCTION AIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=269*)
    (* extract the SIGN bit *)
    IF SIGN < 32 THEN
    	temp1 := SHR(IN,SIGN);
    	sx := temp1.0;
    ELSE
    	sx := FALSE;
    END_IF
    temp1 := SHR(ff, 32-BYTE_TO_USINT(BITS));
    temp2 := IN AND temp1;
    AIN := (HIGH - LOW) * DWORD_TO_REAL(temp2) / DWORD_TO_REAL(temp1) + LOW;
    IF sx THEN AIN := -AIN; END_IF

    (* revision history
    hm 18.8.2006	rev 1.1
    	fixed an error with LOW value negative and HIGH value 0.

    hm 19.1.2007	rev 1.2
    	fixed an error with SIGN bit.

    hm	13.9.2007	rev 1.3
    	changed code to avoid warning under codesys 2.8.1

    hm	2. dec 2007	rev 1.4
    	changed code for better performance

    hm	16. mar 2008	rev 1.5
    	added type conversions to avoid warnings under codesys 30
    *)
END_FUNCTION
