FUNCTION MONTH_BEGIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=129*)
    MONTH_BEGIN := DWORD_TO_DATE(DATE_TO_DWORD(IDATE) - INT_TO_DWORD(DAY_OF_MONTH(IDATE) - 1) * 86400);

    (* revision history
    hm	15. jun. 2008	rev 1.0
    	original version	

    *)
END_FUNCTION
