FUNCTION FSTRING_TO_BYTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=161*)
    IF LEFT(IN, 2) = '2#' THEN
    	(* we need to convert bINary *)
    	FSTRING_TO_BYTE := BIN_TO_BYTE(RIGHT(IN, LEN(IN) - 2));
    ELSIF LEFT(IN, 2) = '8#' THEN
    	(* weneed to convert octals *)
    	FSTRING_TO_BYTE := OCT_TO_BYTE(RIGHT(IN, LEN(IN) - 2));
    ELSIF LEFT(IN, 3) = '16#' THEN
    	(* we need to convert hexadecimal *)
    	FSTRING_TO_BYTE := HEX_TO_BYTE(RIGHT(IN, LEN(IN) - 3));
    ELSE
    	(* we assume decimal representation *)
    	FSTRING_TO_BYTE := DEC_TO_BYTE(CLEAN(IN,'0123456789'));
    END_IF


    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	origINal release

    hm	20. sep. 2008	rev 1.1
    	changed length of INput strINg from 20 to 12
    *)	

END_FUNCTION