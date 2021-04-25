FUNCTION UTC_TO_LTIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=142*)
    tmp := TIME_ZONE_OFFSET * 60 + BOOL_TO_INT(DST_ENABLE AND DST(UTC)) * 3600;
    IF tmp < 0 THEN
    	tmp := ABS(tmp);
    	UTC_TO_LTIME := UDINT_TO_DT(DT_TO_UDINT(UTC) -  INT_TO_UDINT(tmp));
    ELSE
    	UTC_TO_LTIME := UDINT_TO_DT(DT_TO_UDINT(UTC) +  INT_TO_UDINT(tmp));
    END_IF


    (* revision history

    hm 2.10.2006	rev 1.1
    	corrected an error where dst would be delayed by 0.1second

    hm 17.1.2007	rev 1.2
    	added UTC input instead of internal sysrtcgettime because this would only work on wago.
    	DST_ENABLE would not be checked before dst would be enabled.

    hm 18.3.2007	rev 1.3
    	changed code, dst would not work during first cycle.

    hm 24.10.2007	rev 1.4
    	changed code because the execution every 100ms can cause major problems if the supplied time was not correct at start.
    	use of new dst function

    hm 12. nov 2007	rev 1.5
    		changed Type of TIME_ZONE_OFFSET from time to int to allow for time zones with negative offset

    hm	8 dec 2007		rev 1.6
    	corrected a problem with TIME_ZONE_OFFSET

    hm	14. oct. 2008	rev 1.7
    	renamed module from LTIME to UTC_TO_LTIME
    	changed function weekday to day_of_week
    	optimized code for better performance

    hm	20. oct. 2008	rev 1.8
    	changes type of input TIME_ZONE_OFFSET from real to int, now is in +/-minutes
    	deleted outputs DST_ON and WDAY
    	converted to function

    hm	27. feb. 2009	rev 1.9
    	added type conversions to avoid warnings under codesys 3.0

    *)
END_FUNCTION
