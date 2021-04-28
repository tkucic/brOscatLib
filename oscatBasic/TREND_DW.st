FUNCTION_BLOCK TREND_DW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=315*)
    IF DWORD_TO_UDINT(X) > last_X THEN
    	TU := TRUE;
    	TD := FALSE;
    	D := UDINT_TO_DWORD(DWORD_TO_UDINT(X) - last_X);
    	Q := TRUE;
    ELSIF DWORD_TO_UDINT(X) < last_X THEN
    	TD := TRUE;
    	TU := FALSE;
    	D := UDINT_TO_DWORD(last_X - DWORD_TO_UDINT(X));
    	Q := FALSE;
    ELSE
    	TU := FALSE;
    	TD := FALSE;
    	D := 0;
    END_IF
    last_X := DWORD_TO_UDINT(X);



    (* revision history
    hm	21. nov. 2008	rev 1.0
    	original version

    hm	20. feb. 2009	rev 1.1
    	added outputs TU, TD and D

    hm	14. mar. 2009	rev 1.2
    	removed double assignments

    *)

END_FUNCTION_BLOCK
