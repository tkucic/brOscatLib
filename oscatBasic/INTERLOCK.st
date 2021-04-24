FUNCTION_BLOCK INTERLOCK
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=461*)
    (* the input signal have a run delay to lockout the other input *)
    T1(IN := I1, PT := TL);
    T2(IN := I2, PT := TL);

    Q1 := I1 AND NOT T2.Q;
    Q2 := I2 AND NOT T1.Q;


    (* revision history

    hm	28 sep 2007		rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
