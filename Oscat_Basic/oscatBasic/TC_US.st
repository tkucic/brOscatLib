FUNCTION_BLOCK TC_US
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=353*)
    (* read system timer *)
    tx := T_PLC_US();

    IF NOT init THEN
    	init := TRUE;
    	TC := 0;
    ELSE
    	tc := tx - last;
    END_IF
    last := tx;

    (* revision history
    hm		13. mar. 2008	rev 1.0
    	original version

    *)

END_FUNCTION_BLOCK
