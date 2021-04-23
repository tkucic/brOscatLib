FUNCTION_BLOCK LENGTH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=367*)
    YM :=	m
    		+ p * 0.000376065
    		+ IN * 0.0254
    		+ FT * 0.3048
    		+ YD * 0.9144
    		+ MILE * 1609.344
    		+ SM * 1852.0
    		+ FM * 1.829;
    YP := YM * 2659.11478068951;
    YIN := YM * 39.37007874016;
    YFT := YM * 3.28083989501;
    YYD := YM * 1.09361329834;
    YMILE := YM * 0.00062137119;
    YSM := YM * 0.00053995680;
    YFM := YM * 0.54674685621;

    (*
    Länge Meter m SI-BasiseINheit
    Astronomische EINheit* AE 1 AE = 149,597 870 · E9 m
    Parsec pc 1 pc = 206265 AE = 30,857 · E15 m
    Lichtjahr Lj 1 Lj = 9,460 530 · E15 m = 63240 AE = 0,306 59 pc
    Ångström Å 1 Å = E–l0 m
    tYPograph. Punkt p 1 p = 0,376 065 mm • im Druckereigewerbe
    INch** IN 1 IN = 2,54 · E–2 m = 25,4 mm***
    foot FT 1 FT = 0,3048 m = 30,48 cm
    yard YD 1 YD = 0,9144 m
    MILE MILE 1 MILE = 1609,344 m
    INternat. Seemeile SM 1 SM = 1852 m
    Fathom FM 1 FM = 1,829 m • IN der Seeschifffahrt
    *)

    (* revision history

    hm	27. mar. 2007	rev 1.0
    	origINal version

    hm	11. mar. 2009	rev 1.1
    	improved code

    *)

END_FUNCTION_BLOCK
