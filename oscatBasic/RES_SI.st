FUNCTION RES_SI
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=323*)
    TX := T - TS;
    RES_SI := RS * ( 1.0 + A * TX + B * TX * TX);

    (* revision history
    hm	4. aug 2006	rev 1.0
    	original version

    hm	2. dec 2007	rev 1.1
    	changed code for better performance

    hm	11. mar. 2009	rev 1.2
    	changed real constants to use dot syntax

    *)
END_FUNCTION
