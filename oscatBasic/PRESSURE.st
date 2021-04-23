FUNCTION_BLOCK PRESSURE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=371*)
    YBAR := BAR +
    		PA * 1.0E-5 +
    		0.980665 * ATT +
    		1.01325 * ATM +
    		0.001333224 * TORR +
    		0.0980665 * MWS;
    YMWS := yBAR * 10.1971621297793;
    YTORR := yBAR * 750.0615050434140;
    YATT := yBAR * 1.0197162129779;
    yATM := yBAR * 0.9869232667160;
    YPA := yBAR * 100000.0;


    (*
    Druck, Pascal Pa 1 Pa = 1 N/m2 = 1 kg/(s2 E m) . 0,75 E 10.2 mmHg
    mechanische 1 MPa = 1 N/mm2 . fur Festigkeitsangaben
    SPAnnung Bar BAR 1 BAR = 105 Pa = 103 mBAR = 105 kg/(s2 E m)
    Millimeter- mmHg 1 mmHg = 133,322 Pa = 1,333 22 mBAR
    Quecksilbersaule . nur in Heilkunde zulassig
    physik. Atmosphare ATM 1 ATM = 1,013 25 BAR
    techn. Atmosphare at 1 at = 1 kp/cm2 = 0,980665 BAR
    Torr Torr 1 Torr = (101325/760) Pa = 1,333224 mBAR
    Meter-Wassersaule mWS 1 mWS = 9806,65 Pa = 98,0665 mBAR
    psi lbf/in2 1 lbf/in2 = 68,947 57 mBAR = 6894,757 Pa

    *)

    (* revision history

    hm	27. mar. 2007	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	improved code

    *)
END_FUNCTION_BLOCK