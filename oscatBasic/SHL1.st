FUNCTION SHL1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=233*)
    SHL1 := SHR(temp,32-N) OR SHL(IN,N);


    (* revision history
    hm	14.9.2007		rev 1.0
    	origINal version

    hm	27. dec 2007	rev 1.1
    	changed code for better performance

    *)
END_FUNCTION