FUNCTION_BLOCK SCHEDULER_2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=198*)
    Q0 := E0 AND (sx MOD C0 - O0 = 0);
    Q1 := E1 AND (sx MOD C1 - O1 = 0);
    Q2 := E2 AND (sx MOD C2 - O2 = 0);
    Q3 := E3 AND (sx MOD C3 - O3 = 0);

    (* increment cycle counter every cycle *)
    sx := sx + 1;


    (* revision history
    hm 29. sep. 2008		rev 1.0
    	original version


    *)
END_FUNCTION_BLOCK
