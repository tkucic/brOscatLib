FUNCTION_BLOCK M_T
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=342*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF RST OR ET >= TMAX THEN
    	PT :=  t#0s;
    	ET := t#0s;
    ELSIF IN THEN
    	IF NOT edge_ THEN start := tx; END_IF
    	ET := tx - start;
    ELSE
    	PT := ET;
    END_IF
    edge_ := IN;



    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	2. may. 2007	rev 1.1
    	added init variable to avoid unreasonable measurement if falling edge_ occurs first.
    	added ET (elapsed time) output to count from 0 at rising edge_ until a falling edge_ resets ET to 0.
    	added reset input.

    hm	16. sep. 2007	rev 1.2
    	changes time() to T_plc_ms() for compatibility reasons

    hm	17. dec. 2008	rev 1.3
    	code optimized

    hm	10. mar. 2009	rev 1.4
    	removed nested comments
    	removed double assignments

    *)
END_FUNCTION_BLOCK
