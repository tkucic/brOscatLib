FUNCTION DT_TO_SDT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=122*)
    tmp := DT_TO_DATE(DTI);
    tdt := DT_TO_UDINT(DTI) - DATE_TO_UDINT(tmp);
    RETVAL.YEAR := YEAR_OF_DATE(tmp);
    RETVAL.MONTH := MONTH_OF_DATE(tmp);
    RETVAL.DAY := DAY_OF_MONTH(tmp);
    RETVAL.WEEKDAY := DAY_OF_WEEK(tmp);
    RETVAL.SECOND := UDINT_TO_INT(tdt MOD 60);
    RETVAL.MINUTE := UDINT_TO_INT((tdt / 60) MOD 60);
    RETVAL.HOUR := UDINT_TO_INT(tdt / 3600);
    DT_TO_SDT:=TRUE;
    (* revision history

    hm 18. oct. 2008	rev 1.0
    	original version

    *)
END_FUNCTION
