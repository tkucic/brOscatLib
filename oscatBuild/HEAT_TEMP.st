FUNCTION_BLOCK HEAT_TEMP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=33*)
    tr := T_INT + OFFSET;
    tx := (tr - T_EXT) / (T_INT_CONFIG - T_EXT_CONFIG);

    IF T_EXT + H > tr THEN
    	TY := 0.0;
    ELSE
    	TY := LIMIT(TY_MIN, tr + T_DIFF * 0.5 * tx + (TY_CONFIG - T_DIFF * 0.5 - tr) * EXPT(tx, 1.0 / C), TY_MAX);
    END_IF;

    TY := MAX(TY, T_REQ);
    HEAT := TY > 0.0;


    (*

    tv=ti+(tvmax-ti)*((ti-tau)/(ti-taumin))^(1/n)

    tv aktuelle Vorlauftemp.
    ti Raumtemperatur innen (20°C)
    tau aktuelle Außentemperatur
    taumin minimale Außentemperatur -12°C oder -15°C
    n Heizkörperexponent (meistens 1,33)
    Fußbodenheizung = 1,1
    Wandheizung 1,3

    Normen z. B. DIN 4703, DIN 4725 oder die Literatur, z. B Recknagel Abschnitt 1.3.5.

    *)


    (* revision history
    hm	27. jan. 2008	rev 1.0
    	original version

    hm	26. sep. 2008	rev 1.1
    	moved T_INT from config to Input
    	added config variable H
    	corrected error in formula

    hm	13. mar. 2009	rev 1.2
    	improved code

    *)
END_FUNCTION_BLOCK
