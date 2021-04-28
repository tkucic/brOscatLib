FUNCTION RDM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=62*)
    tn := T_PLC_MS();
    tc := BIT_COUNT(UDINT_TO_DWORD(tn));
    tn.31 := tn.2;
    tn.30 := tn.5;
    tn.29 := tn.4;
    tn.28 := tn.1;
    tn.27 := tn.0;
    tn.26 := tn.7;
    tn.25 := tn.6;
    tn.24 := tn.3;
    tn := ROL(tn,BIT_COUNT(UDINT_TO_DWORD(tn))) OR 16#80000001;
    tn := tn MOD 71474513 + INT_TO_UDINT(tc + 77);
    RDM := FRACT(UDINT_TO_REAL(tn) / 10000000.0 * (ce - LIMIT(0.0,LAST,1.0)));


    (*
    pt := ADR(temp);
    pt := (T_PLC_MS() AND 16#007FFFFF) OR 16#3D000000;
    RDM := fract(modR(temp*e+pi1, PI1-LAST) + modR(temp*PI1+e + LAST,e-LAST));
    *)

    (* revision history
    hm		16. jan 2007		rev 1.0
    	original version

    hm		11. nov 2007		rev 1.1
    	changed time() into t_plc_ms()

    hm		20. nov 2007		rev 1.2
    	changed code of temp calculation to avoid overflow in modr due to resuclt would not fit DINT for high timeer values

    hm		5. jan 2008		rev 1.3
    	changed calculation of temp to avoid problem with high values of t_plc_ms

    hm		2. feb 2008		rev 1.4
    	changed algorithm to avoind non iec functions and guarantee more randomness

    hm	10. mar. 2008		rev 1.5
    	make sure LAST will be between 0 and 1 to avoid invalid results

    hm	16. mar. 2008		rev 1.6
    	added conversion for tc to avoid warnings under codesys 3.0

    hm	18. may. 2008		rev 1.7
    	changed constant E to E1

    hm	18. oct. 2008		rev 1.8
    	using math constants

    hm	10. mar. 2009		rev 1.9
    	real constants updated to new systax using dot

    *)
END_FUNCTION
