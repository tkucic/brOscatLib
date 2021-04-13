FUNCTION DAY_OF_DATE
    DAY_OF_DATE := DWORD_TO_DINT(DATE_TO_DWORD(idate) / 86400);


    (* revision history
    hm		16.9.2007		rev 1.0
    	original version

    hm		1. okt 2007		rev 1.1
    	added step7 compatibility

    hm		22. mar. 2008	rev 1.2
    	changed output from int to Dint because the total date range is 49710 days

    hm		7. apr. 2008	rev 1.3
    	deleted unused step7 code

    *)
END_FUNCTION