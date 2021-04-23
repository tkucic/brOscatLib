FUNCTION TEMP_NI
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=325*)
    TEMP_NI := (SQRT(0.30085225 - 2.66E-3 * (R0 - Res)) - 0.5485) * 751.8796992;


    (* revision history

    hm 24.1.2007		rev 1.1
    	deleted unused variable A, B, C

    hm 10.9.2007		rev 1.2
    	changed accuracy to 0.02 degrees to improove performace

    hm 17. 12 2007	rev 1.3
    	improovements for better performance and higher accuracy

    hm	6. jan 2008	rev 1.4
    	further performance improvement

    hm	10. mar. 2009	rev 1.5
    	removed nested comments

    *)


END_FUNCTION