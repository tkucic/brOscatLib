FUNCTION SECOND
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=135*)
    SECOND := UDINT_TO_REAL(TOD_TO_UDINT(ITOD) - TOD_TO_UDINT(ITOD)/60000 * 60000) / 1000.0;



    (* change history

    hm	2. oct. 2006 rev 1.1 
    	changed name of input to ITOD

    *)
END_FUNCTION
