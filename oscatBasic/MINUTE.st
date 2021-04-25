FUNCTION MINUTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=128*)
    MINUTE := UDINT_TO_INT(TOD_TO_UDINT(ITOD) / 60000 - TOD_TO_UDINT(ITOD) / 3600000 * 60);


    (* change history

    2.10.2006 changes name of input to ITOD

    *)
END_FUNCTION
