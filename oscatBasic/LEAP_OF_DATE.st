FUNCTION LEAP_OF_DATE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=127*)
    LEAP_OF_DATE := SHL(((DATE_TO_UDINT(IDATE) + 43200) / 31557600), 30) = 16#80000000;


    (* change history

    2.10.2006		rev 1.1
    the function now calls leap_year to accomodate further accuracy.
    the function now works for any year from 1970 to 2100

    8. jan 2008		rev 1.2
    	improved code for better performance

    28. jan. 2011	rev 1.3
    	improved performance
    *)
END_FUNCTION
