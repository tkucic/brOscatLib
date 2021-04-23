FUNCTION OVERRIDE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=286*)
    IF E1 THEN OVERRIDE := X1; END_IF
    IF E2 AND ABS(X2) > ABS(OVERRIDE) THEN OVERRIDE := X2; END_IF
    IF E3 AND ABS(X3) > ABS(OVERRIDE) THEN OVERRIDE := X3; END_IF

    (* revision history
    hm	4.11.2007		rev 1.0
    	original version

    *)

END_FUNCTION
