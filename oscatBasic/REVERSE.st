FUNCTION REVERSE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=232*)
    (* new code donated by rebler wolfgang *)
    REVERSE := ROR(IN,1) AND 2#10001000 OR ROL(IN,1) AND 2#00010001 OR ROR(IN,3) AND 2#01000100 OR ROL(IN,3) AND 2#00100010;

    (* old code
    REVERSE := SHL(IN,7) OR SHR(IN,7) OR (ROR(IN,3) AND 2#01000100) OR (ROL(IN,3) AND 2#00100010)
    	OR (SHL(IN,1) AND 2#00010000) OR (SHR(IN,1) AND 2#00001000);
    *)

    (* revision history
    hm		9.oct 2007		rev 1.0
    	original version

    hm		18. feb 2008	rev 1.1
    	improved performance

    RW    3. feb. 2021  	rev 1.2
    	improved performance
    *)
END_FUNCTION
