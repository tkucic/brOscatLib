FUNCTION_BLOCK AUTORUN
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=19*)
    (* run the INtegrator when T_off > T#0s *)
    IF TOFF > T#0s THEN
    	timer(DIR:= OUT, TR := SEL(OUT, TOFF, TRUN), RMP := val);
    ELSE
    	val := 255;
    END_IF


    (* when timer = 0 or TEST then INitiate autorun until timer reaches 255 *)
    IF (NOT ARX AND ARE AND val = 0) OR TEST THEN
    	val := 0;
    	ARO := TRUE;
    	ARX := TRUE;
    ELSIF val = 255 AND ARO THEN
    	ARO := FALSE;
    	ARX := FALSE;
    END_IF

    (* OUTput is true when autorun ARO is true or IN = TRUE *)
    OUT := IN OR ARO;



    (* revision history
    hm 20. nov. 2008	rev 1.0
    	origINal version

    *)
END_FUNCTION_BLOCK
