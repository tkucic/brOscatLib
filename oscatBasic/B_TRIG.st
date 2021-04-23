FUNCTION_BLOCK B_TRIG
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=188*)
    Q := CLK XOR edge;
    edge := CLK;


    (* revision history
    hm		4. aug. 2006	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
