FUNCTION_BLOCK DEAD_BAND_A
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=393*)
    (* filter the input signal *)
    tp1(IN := X, T:= T);

    (* filter the HF portion to generate a stable L *)
    tp2(IN := ABS(tp1.OUT - X), T := MULTIME(T, 4.0));

    (* now we determine L which is half the width of the dead band *)
    L := MIN(KL * tp2.OUT, LM);

    IF X > L THEN
    	Y := X - L;
    ELSIF X < -L THEN
    	Y := X + L;
    ELSE
    	Y := 0.0;
    END_IF


    (* revision history
    hm	14. jun. 2008	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	real constants updated to new systax using dot

    *)
END_FUNCTION_BLOCK
