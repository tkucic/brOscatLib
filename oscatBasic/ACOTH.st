FUNCTION ACOTH
<<<<<<< HEAD:oscatBasic/ACOTH.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=39*)
    ACOTH := LN((x+1.0)/(x-1.0))*0.5;
=======
    ACOTH := LN((X+1.0)/(X-1.0))*0.5;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/ACOTH.st

    (* revision history
    hm		12 jan 2007	rev 1.0
    	original version

    hm		5. jan 2008	rev 1.1
    	improved code for better performance

    hm	10. mar. 2009		rev 1.2
    	real constants updated to new systax using dot

    *)
END_FUNCTION
