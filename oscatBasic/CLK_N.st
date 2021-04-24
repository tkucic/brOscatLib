FUNCTION_BLOCK CLK_N
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=192*)
    stime := SHR(T_PLC_MS(),N);
    clk := stime.0;
    Q := clk XOR edge_;
    edge_ := clk;

    (* revision history
    hm	16. dec 2007		rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
