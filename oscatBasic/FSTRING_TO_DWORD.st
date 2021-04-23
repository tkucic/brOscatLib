FUNCTION FSTRING_TO_DWORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=162*)
    IF LEFT(IN, 2) = '2#' THEN
    	(* we need to convert bINary *)
    	FSTRING_TO_DWORD := BIN_TO_DWORD(RIGHT(IN, LEN(IN) - 2));
    ELSIF LEFT(IN, 2) = '8#' THEN
    	(* weneed to convert octals *)
    	FSTRING_TO_DWORD := OCT_TO_DWORD(RIGHT(IN, LEN(IN) - 2));
    ELSIF LEFT(IN, 3) = '16#' THEN
    	(* we need to convert hexadecimal *)
    	FSTRING_TO_DWORD := HEX_TO_DWORD(RIGHT(IN, LEN(IN) - 3));
    ELSE
    	(* we assume decimal representation *)
    	FSTRING_TO_DWORD := DEC_TO_DWORD(CLEAN(IN,'0123456789'));
    END_IF


    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	origINal release

    hm	20. sep. 2008	rev 1.1
    	changed length of INput dtrINg from 20 to 40


    *)	

END_FUNCTION