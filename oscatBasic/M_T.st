FUNCTION_BLOCK M_T
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=342*)
    (* read system time *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    IF RST OR ET >= TMAX THEN
    	PT :=  t#0s;
    	ET := t#0s;
    ELSIF IN THEN
    	IF NOT EDGE_ THEN start := tx; END_IF
    	ET := tx - start;
    ELSE
    	PT := ET;
    END_IF
    EDGE_ := IN;



    (* revision history
    hm	4. aug. 2006	rev 1.0
    	origINal version

    hm	2. may. 2007	rev 1.1
    	added INit variable to avoid unreasonable measurement if fallINg EDGE_ occurs fiRST.
    	added ET (elapsed time) output to count from 0 at risINg EDGE_ until a fallINg EDGE_ resETs ET to 0.
    	added resET INput.

    hm	16. sep. 2007	rev 1.2
    	changes time() to T_plc_ms() for compatibility reasons

    hm	17. dec. 2008	rev 1.3
    	code oPTimized

    hm	10. mar. 2009	rev 1.4
    	removed nested comments
    	removed double assignments

    *)
END_FUNCTION_BLOCK
