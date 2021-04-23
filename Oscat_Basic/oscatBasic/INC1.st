FUNCTION INC1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=56*)
    IF X >= N - 1 THEN
    	INC1 := 0;
    ELSE
    	INC1 := X + 1;
    END_IF



    (* revision history
    hm	13. oct. 2008	rev 1.0
    	original version

    hm	22. oct. 2008	rev 1.1
    	added statement to return value for compatibility reasons

    hm	23. feb. 2009	rev 1.2
     	when inc1 is called with X >= N inc will continue with 0
    *)
END_FUNCTION