FUNCTION_BLOCK FT_PD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=403*)
    (* run differentiator *)
    diff(IN := IN, K := TV);

    (* combine both values *)
    Y := KP * (diff.OUT + IN);



    (* revision history
    hm 	3. jun. 2008 	rev 1.0
    	original version


    *)
END_FUNCTION_BLOCK
