FUNCTION GAUSS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=52*)
    temp := X - U;
    SI_inv := 1.0  / SI;
    GAUSS := EXP(Temp * Temp * SI_inv * SI_inv * - 0.5) * 0.39894228 * SI_inv;



    (* reviSIon hisdtory
    hm	6. apr. 2008	rev 1.0
    	original verSIon

    hm	27. oct. 2008	rev 1.1
    	optimized performance	

    hm	10. mar. 2009	rev 1.2
    	real constants updated to new systax uSIng dot

    *)
END_FUNCTION
