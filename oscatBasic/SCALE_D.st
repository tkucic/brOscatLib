FUNCTION SCALE_D
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=293*)
    _I_HI := DWORD_TO_UDINT(I_HI);
    _I_LO := DWORD_TO_UDINT(I_LO);
    IF _I_HI = _I_LO THEN
    	SCALE_D := O_LO;
    ELSE
    	SCALE_D := (O_HI - O_LO) / UDINT_TO_REAL(_I_HI - _I_LO) * UDINT_TO_REAL(LIMIT(_I_LO, DWORD_TO_UDINT(X), _I_HI) - _I_LO) + O_LO;
    END_IF

    (* revision history
    hm	18. may. 2008	rev 1.0
    	original version

    hm	13. nov. 2008	rev 1.1
    	corrected formula for negative gradient

    hm	11. jan 2011	rev 1.2
    	avoid division by 0
    *)
END_FUNCTION
