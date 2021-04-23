FUNCTION TEMP_NTC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=326*)
    IF RES > 0.0 THEN
    	TEMP_NTC := B * 298.15 / (B + LN(RES / RN) * 298.15) -273.15;
    END_IF


    (* revision history

    hm 30. dec. 2008	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	changed real constants to use dot syntax

    *)
END_FUNCTION