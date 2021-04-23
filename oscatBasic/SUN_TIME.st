FUNCTION_BLOCK SUN_TIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=139*)
    B := LATITUDE * 0.0174532925199433;
    MIDDAY := SUN_MIDDAY(LONGITUDE, UTC);
    DK := 0.40954 * SIN(0.0172 * (INT_TO_REAL(DAY_OF_YEAR(UTC)) - 79.35));
    SUN_DECLINATION := DEG(DK);
    IF SUN_DECLINATION > 180.0 THEN SUN_DECLINATION := SUN_DECLINATION - 360.0; END_IF
    SUN_DECLINATION := 90.0 - LATITUDE + SUN_DECLINATION;
    delta := HOUR_TO_TIME(ACOS((SIN(RAD(H)) - SIN(B) * SIN(DK)) / (COS(B) * COS(DK))) * 3.819718632);
    SUN_RISE := MIDDAY - delta;
    SUN_SET := MIDDAY + delta;

    (* revision history

    rev 1.1	hm	20.1.2007
    	deleted unused variables SUN_RISER and SUN_SETR

    rev 1.2 hm 17.4.2007
    	corrected error while sun:MIDDAY would not be corrected for LONGITUDE.

    rev 1.3	hm	6. jan 2008
    	performance improvements

    rev	1.4 hm	17. jan 2008
    	calculation is now only performed once a day

    hm	10. mar. 2009	rev 1.5
    	improved performance
    	calculation will be performed on every call to allow movong installations

    hm	26. jul 2009	rev 1.6
    	fixed a problem with wrong MIDDAY calculation

    hm	25. jan. 2011	rev 1.7
    	using function sun_MIDDAY
    	corrected angle of SUN_DECLINATION
    	added input H
    *)
END_FUNCTION_BLOCK
