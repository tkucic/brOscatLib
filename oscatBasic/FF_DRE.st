FUNCTION_BLOCK FF_DRE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=240*)
    IF RST OR SET THEN
    	Q := NOT RST;
    ELSIF CLK AND NOT edge THEN
    	Q := D;
    END_IF
    edge := CLK;

    (* revision history
    hm	4. aug 2006		rev 1.0
    	original version

    hm	27. dec 2007	rev 1.1
    	changed code for better performance

    hm	30. oct. 2008	rev 1.2
    	optimized performance
    *)
END_FUNCTION_BLOCK
