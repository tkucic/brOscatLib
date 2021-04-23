FUNCTION_BLOCK PRESSURE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=371*)
    Ybar := bar +
    		pa * 1.0E-5 +
    		0.980665 * att +
    		1.01325 * atm +
    		0.001333224 * torr +
    		0.0980665 * mws;
    Ymws := ybar * 10.1971621297793;
    Ytorr := ybar * 750.0615050434140;
    Yatt := ybar * 1.0197162129779;
    yatm := ybar * 0.9869232667160;
    Ypa := ybar * 100000.0;


    (*
    Druck, Pascal Pa 1 Pa = 1 N/m2 = 1 kg/(s2 E m) . 0,75 E 10.2 mmHg
    mechanische 1 MPa = 1 N/mm2 . fur Festigkeitsangaben
    Spannung Bar bar 1 bar = 105 Pa = 103 mbar = 105 kg/(s2 E m)
    Millimeter- mmHg 1 mmHg = 133,322 Pa = 1,333 22 mbar
    Quecksilbersaule . nur in Heilkunde zulassig
    physik. Atmosphare atm 1 atm = 1,013 25 bar
    techn. Atmosphare at 1 at = 1 kp/cm2 = 0,980665 bar
    Torr Torr 1 Torr = (101325/760) Pa = 1,333224 mbar
    Meter-Wassersaule mWS 1 mWS = 9806,65 Pa = 98,0665 mbar
    psi lbf/in2 1 lbf/in2 = 68,947 57 mbar = 6894,757 Pa

    *)

    (* revision history

    hm	27. mar. 2007	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	improved code

    *)
END_FUNCTION_BLOCK