FUNCTION HOUR_OF_DT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=125*)
    HOUR_OF_DT := UDINT_TO_INT((DT_TO_UDINT(XDT) MOD 86400) / 3600);


    (* revision history
    hm		6.9.2008	rev 1.0
    	original version


    *)
END_FUNCTION
