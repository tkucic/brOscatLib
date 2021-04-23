FUNCTION PERIOD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=131*)
    day1 := DAY_OF_YEAR(D1);
    day2 := DAY_OF_YEAR(D2);
    dayx := DAY_OF_YEAR(DX);
    IF NOT LEAP_OF_DATE(DX) AND dayx > 58 THEN dayx := dayx + 1; END_IF
    IF NOT LEAP_OF_DATE(D1) AND day1 > 58 THEN day1 := day1 + 1; END_IF
    IF NOT LEAP_OF_DATE(D2) AND day2 > 58 THEN day2 := day2 + 1; END_IF

    IF day2 < day1 THEN
    	(* the PERIOD spans over the new year *)
    	PERIOD := dayx <= day2 OR dayx >= day1;
    ELSE
    	PERIOD := dayx >= day1 AND dayx <= day2;
    END_IF

    (* code before rev 1.2
    yx := year(DX);
    p1 := date_add(D1,0,0,0,yx - year(D1));
    p2 := date_add(D2,0,0,0,yx - year(D2));

    IF p2 >= p1 THEN
    	PERIOD := DX <= p2  AND DX >= p1;
    ELSE
    	PERIOD := DX <= p2 OR DX >= p1;
    END_IF
    *)


    (* revision history

    hm		19. sep 2007	rev 1.0
    	original version

    hm		20. sep 2007	rev 1.1
    	corrected a problem with leap year

    hm		4. jan 2008		rev 1.2
    	changed code for better performance

    hm		22. mar. 2008	rev 1.3
    	function would deliver wrong results when D1, D2 or DX are a leap_year

    *)
END_FUNCTION
