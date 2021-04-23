FUNCTION_BLOCK SPEED
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=372*)
    YMS := MS +
    		KMH * 0.27777777777778 +
    		KN * 0.5144444 +
    		MH * 0.44704;
    YKMH := YMS * 3.6;
    YKN := YMS * 1.94384466037535;
    YMH := YMS * 2.23693629205440;

    (*
    Geschwindigkeit Meter durch Sekunde m/s 1 m/s = 3,6 km/h
    km durch (pro) Stunde, nicht „Stundenkilometer“ verwenden
    KNoten KN 1 KN = 1 sm/h = 0,5144 m/s

    *)

    (* revision history
    hm	27. mar. 2009	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	improved code

    *)
END_FUNCTION_BLOCK
