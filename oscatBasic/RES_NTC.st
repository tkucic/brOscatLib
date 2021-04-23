FUNCTION RES_NTC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=319*)
    RES_NTC := RN * EXP(B * (1.0 / (T+273.15) - 0.00335401643468053));



    (* revision history

    hm 30. dec. 2008	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	changed real constants to use dot syntax

    *)
END_FUNCTION
