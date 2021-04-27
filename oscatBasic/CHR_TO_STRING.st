FUNCTION CHR_TO_STRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=148*)
    PT ACCESS ADR(RETVAL); //Assign the return value address to pointer
    PT := C; // set the pointers value to C
    PT ACCESS (ADR(PT) + 1); //increment the pointers value by one to get the next byte of the return string. STRING[1] is two bytes long
    PT := 0; //Set the pointer value to 0
    CHR_TO_STRING := TRUE;

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
