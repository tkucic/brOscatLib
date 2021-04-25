FUNCTION HOUR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=124*)
    HOUR := UDINT_TO_INT(TOD_TO_UDINT(ITOD) / 3600000);


    (* change history
    hm 4. aug 2006	rev 1.0
    	original version

    hm 2.10.2006 	rev 1.1
    	changed name of input to ITOD

    *)
END_FUNCTION
