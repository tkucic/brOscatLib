FUNCTION ERF
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=47*)
    x2 := X*X;
    ax2 := 0.147 * x2 + 1.0;
    ERF := SQRT(1.0 - EXP(-x2 * ((0.27323954473516 + aX2)/(ax2)))) * SGN(X);




    (* revision history
    hm	7. apr. 2008	rev 1.0
    	original version

    hm	30. jun. 2008	rev 1.1
    	added type conversions to avoid warnings under codesys 3.0

    hm	25. oct. 2008	rev 1.2
    	new code using new algorithm

    hm	10. mar. 2009	rev 1.3
    	real constants updated to new systax using dot
    *)
END_FUNCTION
