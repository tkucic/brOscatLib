FUNCTION_BLOCK RTC_2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=133*)
    (* call rtc *)
    RT(SET := SET, SDT := SDT, SMS := SMS);
    UDT := RT.XDT;
    XMS := RT.XMS;

    (* check for daylight savings time and SET DSO output *)
    DSO := DST(UDT) AND DEN;

    (* calculate time offset and SET ldt output *)
    LOCAL_DT := UDINT_TO_DT(DT_TO_UDINT(UDT) + INT_TO_UDINT(OFS + BOOL_TO_INT(DSO)*60) * 60);


    (* revision history
    hm		20. jan. 2008	rev 1.0
    	original version

    hm		20. feb. 2008	rev 1.1
    	added Millisecond SET input

    hm		12. jun. 2008	rev 1.2
    	improved performance

    hm		20. jan. 2011	rev 1.3
    	changed offset to be in minutes

    hm		27. apr. 2011	rev 1.4
    	fixed error with local time calculation

    hm     3. Feb 2021     rev 1.5
         changed LDT to LOCAL_DT for compatibility with IEC61131-3

    *)
END_FUNCTION_BLOCK
