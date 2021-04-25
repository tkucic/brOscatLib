FUNCTION AIR_DENSITY
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=426*)
    AIR_DENSITY := cPN * (1.0 - RH * SDD(T, TRUE) * RX / P) / (RL * ( T - cT0));

    (* original code used for rev 1.0

    SDD := SDD(T,FALSE);
    RF := RL / (1- RH*SDD/P*RX);
    AIR_DENSITY := P / (RF * (T-TK));

    *)

    (* revision history

    hm	29.10.2007	rev 1.0
    	original version

    hm	4.12.2007		rev 1.1
    	changed code for better performance

    hm	18. oct. 2008	rev 1.2
    	using phys constants

    hm	13. mar. 2009	rev 1.3
    	real constants updated to new systax using dot

    *)


END_FUNCTION
