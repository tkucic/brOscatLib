FUNCTION MINUTE_OF_DT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=128*)
    MINUTE_OF_DT := UDINT_TO_INT(DT_TO_UDINT(XDT) MOD 3600) / 60;


    (* revision history
    hm		6.9.2008	rev 1.0
    	original version


    *)
END_FUNCTION
