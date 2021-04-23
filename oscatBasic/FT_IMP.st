FUNCTION_BLOCK FT_IMP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=399*)
    T1(IN:= IN, T:=T);
    OUT := (IN - t1.OUT) * K;

    (*
    hm 3.1.2007	rev 1.1
    	added factor K

    *)
END_FUNCTION_BLOCK
