FUNCTION JD2000
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=126*)
    JD2000 := DWORD_TO_REAL(DT_TO_DWORD(DTI) - 946728000) / 86400.0;

    (* revision histroy
    hm	15. jul. 2008	rev 1.0
    	original release


    *)	

END_FUNCTION
