FUNCTION CHR_TO_STRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=148*)
    PT := ADR(CHR_TO_STRING);
    PT := C;
    PT := PT + 1;
    PT := 0;

    (* revision history
    hm	16 jan 2007		rev 1.0
    	original version

    hm	4. feb. 2008	rev 1.1
    	return string would not be terminated properly

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(1)

    hm	17. dec. 2008	rev 1.3
    	changed name of function from chr to CHR_TO_STRING
    *)
END_FUNCTION
