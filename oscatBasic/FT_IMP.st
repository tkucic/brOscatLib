FUNCTION_BLOCK FT_IMP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=399*)
    T1(in:= in, T:=T);
    out := (in - t1.out) * K;

    (*
    hm 3.1.2007	rev 1.1
    	added factor K

    *)
END_FUNCTION_BLOCK
