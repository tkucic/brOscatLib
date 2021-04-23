FUNCTION_BLOCK TC_S
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=353*)
    (* read system timer *)
    tx := T_PLC_US();

    IF NOT init THEN
    	init := TRUE;
    	TC := 0.0;
    ELSE
<<<<<<< HEAD:oscatBasic/TC_S.st
    	TC := DWORD_TO_REAL(tx - last)*1.0E-6;
=======
    	TC := UDINT_TO_REAL(tx - last)*1.0E-6;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMeasure/TC_S.st
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
