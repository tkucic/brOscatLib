FUNCTION DAYS_DELTA
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=118*)
    IF DATE_1 > DATE_2 THEN
    	DAYS_DELTA := - UDINT_TO_DINT((DATE_TO_UDINT(DATE_1) - DATE_TO_UDINT(DATE_2)) / 86400);
    ELSE
    	DAYS_DELTA := UDINT_TO_DINT((DATE_TO_UDINT(DATE_2) - DATE_TO_UDINT(DATE_1)) / 86400);
    END_IF

    (* revision history
    hm	27. dec 2006	rev 1.0
    	original version

    hm	16.9.2007		rev 1.1
    	coorected an error in formula and changed algorithm to show positive and negative delta

    hm	22. mar. 2008	rev 1.2
    	changed output from int to dint because the total date range is 49710 days

    hm	25. jan. 2011	rev 1.3
    	improved performance
    *)
END_FUNCTION
