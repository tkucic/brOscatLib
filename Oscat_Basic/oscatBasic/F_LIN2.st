FUNCTION F_LIN2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=96*)
    F_LIN2 := (Y2 - Y1) / (X2 - X1) * (X - X1) + Y1;


    (* revision history
    hm	1. jan. 2007	rev 1.0
    	original release

    hm	17. dec. 2008	rev 1.1
    	optimized formula

    *)
END_FUNCTION
