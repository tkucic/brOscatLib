FUNCTION ACOTH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=39*)
    ACOTH := LN((x+1.0)/(x-1.0))*0.5;

    (* revision history
    hm		12 jan 2007	rev 1.0
    	original version

    hm		5. jan 2008	rev 1.1
    	improved code for better performance

    hm	10. mar. 2009		rev 1.2
    	real constants updated to new systax using dot

    *)
END_FUNCTION
