FUNCTION_BLOCK FT_IMP
    T1(in:= in, T:=T);
    out := (in - t1.out) * K;

    (*
    hm 3.1.2007	rev 1.1
    	added factor K

    *)
END_FUNCTION_BLOCK