FUNCTION SDT_TO_TOD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=135*)
    SDT_TO_TOD := UDINT_TO_TOD(INT_TO_UDINT(DTI.HOUR) * 3600000 + INT_TO_UDINT(DTI.MINUTE) * 60000 + INT_TO_UDINT(DTI.SECOND) * 1000 + INT_TO_UDINT(DTI.MS));



    (* revision history

    hm 18. oct. 2008	rev 1.0
    	original version

    hm	16. nov. 2008	rev 1.1
    	added typecasts to avoid warnings
    *)
END_FUNCTION
