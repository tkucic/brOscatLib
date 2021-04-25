FUNCTION_BLOCK TC_S
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=353*)
    (* read system timer *)
    tx := T_PLC_US();

    IF NOT init THEN
    	init := TRUE;
    	TC := 0.0;
    ELSE
    	TC := UDINT_TO_REAL(tx - last)*1.0E-6;
    END_IF
    last := tx;

    (* revision history
    hm	13. mar. 2008	rev 1.0
    	original version

    hm	16. mar 2008	rev 1.1
    	added type conversion to avoid warnings under codesys 3.0

    hm	11. mar. 2009	rev 1.2
    	changed real constants to use dot syntax

    *)

END_FUNCTION_BLOCK
