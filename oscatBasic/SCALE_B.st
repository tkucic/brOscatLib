FUNCTION SCALE_B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=289*)
    _I_HI := BYTE_TO_USINT(I_HI);
    _I_LO := BYTE_TO_USINT(I_LO);
    IF I_HI = I_LO THEN
    	SCALE_B := O_LO;
    ELSE
    	SCALE_B := (O_HI - O_LO) / USINT_TO_REAL(_I_HI - _I_LO) * USINT_TO_REAL(LIMIT(_I_LO, BYTE_TO_USINT(X), _I_HI));
    END_IF

    (* revision history
    hm	18. may. 2008		rev 1.0
    	original version

    hm	18. jan 2011		rev 1.1
    	avoid division by 0

    *)
END_FUNCTION
