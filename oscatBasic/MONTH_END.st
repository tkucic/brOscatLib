FUNCTION MONTH_END
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=130*)
    MONTH_END := UDINT_TO_DATE(DATE_TO_UDINT(SET_DATE(YEAR_OF_DATE(IDATE),MONTH_OF_DATE(IDATE)+1,1)) - 86400);



    (* revision history
    hm	15. jun. 2008	rev 1.0
    	original version	

    hm	7. oct. 2008	rev 1.1
    	changed function year to year_of_date
    	changed function month to month_of_date

    *)
END_FUNCTION
