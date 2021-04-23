FUNCTION DT2_TO_SDT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=121*)
    DT2_TO_SDT.YEAR := YEAR_OF_DATE(DI);
    DT2_TO_SDT.MONTH := MONTH_OF_DATE(DI);
    DT2_TO_SDT.DAY := DAY_OF_MONTH(DI);
    DT2_TO_SDT.WEEKDAY := DAY_OF_WEEK(DI);
    DT2_TO_SDT.MS := DWORD_TO_INT(TOD_TO_DWORD(TI) MOD 1000);
    DT2_TO_SDT.SECOND := DWORD_TO_INT((TOD_TO_DWORD(TI) / 1000) MOD 60);
    DT2_TO_SDT.MINUTE := DWORD_TO_INT((TOD_TO_DWORD(TI) / 60000) MOD 60);
    DT2_TO_SDT.HOUR := DWORD_TO_INT(TOD_TO_DWORD(TI) / 3600000);

    (* revision history

    hm 18. oct. 2008	rev 1.0
    	original version

    *)
END_FUNCTION
