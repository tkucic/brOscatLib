FUNCTION YEAR_BEGIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=143*)
    YEAR_BEGIN := UDINT_TO_DATE(SHR(INT_TO_UDINT(Y) * 1461 - 2878169,2) * 86400);



    (* revision history
    hm	19. dec 2007	rev 1.0
    	original version

    hm	4. jan 2008		rev 1.1
    	formula for step7 was incorrect during leap years

    hm	7. apr. 2008	rev 1.2
    	deleted unused step7 code
    *)

END_FUNCTION
