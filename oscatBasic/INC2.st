FUNCTION INC2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=56*)
    tmp := U - L + 1;
    INC2 := (X + D - L + tmp) MOD tmp + L;



    (* revision history
    hm	29. jun. 2008		REV 1.0
    	original version


    *)
END_FUNCTION
