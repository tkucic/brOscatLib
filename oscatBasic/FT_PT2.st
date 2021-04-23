FUNCTION_BLOCK FT_PT2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=415*)
    (* startup INitialisation *)
    IF NOT INit OR T = T#0s THEN
    	INit := TRUE;
    	OUT := K * IN;
    	I2 := OUT;
    ELSE
    	TN := TIME_TO_REAL(T) * 1.0E-3;
    	tn2 := TN * TN;
    	INt1(X := IN * K / tn2 - I1 * 0.5 * D / TN - I2 / TN2, Y := I1);
    	INt2(X := I1,Y := I2);
    	OUT := I2;
    END_IF


    (* revision history

    15.1.2007 hm		rev 1.1
    	changed formula to new more acurate formula

    hm 15.9.2007		rev 1.2
    	deleted unused code for INit system time readINg tx	

    hm	30.11.2007	rev 1.3
    	changed OUT to be K * IN durINg INitialization
    	avoINd divide by 0 if tn = 0

    hm	3. nov. 2008	rev 1.4
    	optimized code and fixed a problem with INit

    hm	11. mar. 2009	rev 1.5
    	real constants updated to new systax usINg dot

    *)
END_FUNCTION_BLOCK
