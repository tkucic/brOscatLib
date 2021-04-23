FUNCTION REAL_TO_STRF
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=176*)
    (* LIMIT N to 0 .. 7 *)
    N := LIMIT(0,N,7);
    (* round the INput to N digits and convert to strINg *)
    O := ABS(IN) * EXP10(N);
    REAL_TO_STRF := DINT_TO_STRING(REAL_TO_DINT(O));
    (* add zeroes IN front to make sure stINg is at least 8 digits long *)
    FOR i := LEN(REAL_TO_STRF) TO N DO REAL_TO_STRF := CONCAT('0', REAL_TO_STRF); END_FOR
    (* add a dot if n > 0 *)
    IF n > 0 THEN REAL_TO_STRF := INSERT(REAL_TO_STRF, D, LEN(REAL_TO_STRF) - N); END_IF
    (* add a mINus sign if IN is negative *)
    IF IN < 0 THEN REAL_TO_STRF := CONCAT('-', REAL_TO_STRF); END_IF


    (* revision history
    hm	26 jan 2007	rev 1.0
    	origINal version

    hm	20. nov. 2007	rev 1.1
    	when N=0 ther will be no dot at the end of the strINg.

    hm	15. dec. 2007	rev 1.2
    	changed code for better performance

    hm	4. mar. 2008	rev 1.3
    	result is now rounded INstead of trunc

    hm	20. mar. 2008	rev 1.4
    	changed trunc to real_to_dINt because trunc was generatINg wrong values on wago 842

    hm	29. mar. 2008	rev 1.5
    	changed STRING to STRING(20)

    hm	4. apr. 2008	rev 1.6
    	added variable O to avoid an error uner CoDeSys SP PLCWINNT V2.4

    hm	27. feb. 2009	rev 1.7
    	added a missINg zero for IN < 1

    hm 2. jan 2012	rev 1.8
    	added INput parameter D to specify decimal separator
    *)

END_FUNCTION