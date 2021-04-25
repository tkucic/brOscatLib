FUNCTION_BLOCK SUN_TIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=139*)
    B := latitude * 0.0174532925199433;
    MIDDAY := SUN_MIDDAY(longitude, utc);
    DK := 0.40954 * SIN(0.0172 * (INT_TO_REAL(DAY_OF_YEAR(utc)) - 79.35));
    sun_declination := DEG(DK);
    IF sun_declination > 180.0 THEN sun_declination := sun_declination - 360.0; END_IF;
    sun_declination := 90.0 - LATITUDE + sun_declination;
    delta := HOUR_TO_TIME(ACOS((SIN(RAD(H)) - SIN(B) * SIN(DK)) / (COS(B) * COS(DK))) * 3.819718632);
    sun_rise := MIDDAY - delta;
    sun_set := MIDDAY + delta;

    (* revision history

    rev 1.1	hm	20.1.2007
    	deleted unused variables sun_riseR and sun_setR

    rev 1.2 hm 17.4.2007
    	corrected error while sun:midday would not be corrected for longitude.

    rev 1.3	hm	6. jan 2008
    	performance improvements

    rev	1.4 hm	17. jan 2008
    	calculation is now only performed once a day

    hm	10. mar. 2009	rev 1.5
    	improved performance
    	calculation will be performed on every call to allow movong installations

    hm	26. jul 2009	rev 1.6
    	fixed a problem with wrong midday calculation

    hm	25. jan. 2011	rev 1.7
    	using function sun_midday
    	corrected angle of sun_declination
    	added input H
    *)
END_FUNCTION_BLOCK
