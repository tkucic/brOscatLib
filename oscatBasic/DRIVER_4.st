FUNCTION_BLOCK DRIVER_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=454*)
    D0(Set:=set, in:=in0, rst:=rst, toggle_mode:=toggle_mode, timeout:=timeout);
    D1(Set:=set, in:=in1, rst:=rst, toggle_mode:=toggle_mode, timeout:=timeout);
    D2(Set:=set, in:=in2, rst:=rst, toggle_mode:=toggle_mode, timeout:=timeout);
    D3(Set:=set, in:=in3, rst:=rst, toggle_mode:=toggle_mode, timeout:=timeout);
    Q0 := D0.Q;
    Q1 := D1.Q;
    Q2 := D2.Q;
    Q3 := D3.Q;


    (* revision history
    hm	2. jan 2008		rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
