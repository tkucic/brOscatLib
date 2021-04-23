FUNCTION SUN_MIDDAY
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=138*)
    T := INT_TO_REAL(DAY_OF_YEAR(UTC));
    OFFSET := -0.1752 * SIN(0.033430 * T + 0.5474) - 0.1340 * SIN(0.018234 * T - 0.1939);
    SUN_MIDDAY := HOUR_TO_TOD(12.0 - OFFSET - LON * 0.0666666666666);


    (* revision history

    hm	26. jan. 2011	rev 1.0
    	initial release

    *)
END_FUNCTION
