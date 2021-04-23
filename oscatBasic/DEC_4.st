FUNCTION_BLOCK DEC_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=222*)
    Q0 := D AND NOT A0 AND NOT A1;
    Q1 := D AND A0 AND NOT A1;
    Q2 := D AND NOT A0 AND A1;
    Q3 := D AND A0 AND A1;

    (* revision history
    hm 3.3.2007	rev 1.1
    	rewritten in ST for better compatibility

    *)
END_FUNCTION_BLOCK
