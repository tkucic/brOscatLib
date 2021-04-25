FUNCTION_BLOCK FT_PDT1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=403*)
    (* run differentiator *)
    diff(IN := IN, K := TV);

    (* Run PT1 filter *)
    TP(IN := diff.OUT, T := REAL_TO_TIME(T1));

    (* combine both values *)
    Y := KP * (TP.OUT + IN);



    (* revision history
    hm 	3. jun. 2008 	rev 1.0
    	original version


    *)
END_FUNCTION_BLOCK
