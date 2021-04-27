FUNCTION TO_UML
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=180*)
    CASE BYTE_TO_USINT(IN) OF
    	196:	(* Ä *)
    		RETVAL := 'Ae';
    	214:	(* Ö *)
    		RETVAL := 'Oe';
    	220:	(* Ü *)
    		RETVAL := 'Ue';
    	223:	(* ß *)
    		RETVAL := 'ss';
    	228:	(* ä *)
    		RETVAL := 'ae';
    	246:	(* ö *)
    		RETVAL := 'oe';
    	252:	(* ü *)
    		RETVAL := 'ue';
    ELSE
    	CHR_TO_STRING(IN, RETVAL);
    END_CASE
    TO_UML := TRUE;


    (* revision history
    hm	29. mar. 2008	rev 1.0
    	original version

    hm	17. dec. 2008	rev 1.1
    	changes name of function chr to chr_to_string

    *)
END_FUNCTION
