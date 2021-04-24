FUNCTION_BLOCK ESR_COLLECT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=33*)
    IF RST OR cnt < 0 THEN
    	POS := -1;
    ELSE
    	FOR cnt := 0 TO max_in DO
    	IF ESR_0[cnt].TYP > 0 THEN POS := INC1(POS, max_out); ESR_OUT[POS] := ESR_0[cnt]; END_IF
    	IF ESR_1[cnt].TYP > 0 THEN POS := INC1(POS, max_out); ESR_OUT[POS] := ESR_1[cnt]; END_IF
    	IF ESR_2[cnt].TYP > 0 THEN POS := INC1(POS, max_out); ESR_OUT[POS] := ESR_2[cnt]; END_IF
    	IF ESR_3[cnt].TYP > 0 THEN POS := INC1(POS, max_out); ESR_OUT[POS] := ESR_3[cnt]; END_IF
    	IF ESR_4[cnt].TYP > 0 THEN POS := INC1(POS, max_out); ESR_OUT[POS] := ESR_4[cnt]; END_IF
    	IF ESR_5[cnt].TYP > 0 THEN POS := INC1(POS, max_out); ESR_OUT[POS] := ESR_5[cnt]; END_IF
    	IF ESR_6[cnt].TYP > 0 THEN POS := INC1(POS, max_out); ESR_OUT[POS] := ESR_6[cnt]; END_IF
    	IF ESR_7[cnt].TYP > 0 THEN POS := INC1(POS, max_out); ESR_OUT[POS] := ESR_7[cnt]; END_IF
       END_FOR
    END_IF


    (* revision history
    hm	26.jan 2007	rev 1.0
    	original version

    hm	8. dec 2007	rev 1.1
    	added reset input

    ks	27. oct. 2008	rev 1.2
    	optimized code for performance

    ks	12. nov. 2009	rev 1.3
    	output POS was not pointing to last value	

    hm	1. dec. 2009	rev 1.4
    	changed POS to be I/O
    	reduced output array size to 32 elements
    *)
END_FUNCTION_BLOCK
