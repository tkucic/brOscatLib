FUNCTION_BLOCK DRIVER_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=454*)
    D0(Set:=SET, in:=IN0, RST:=RST, TOGGLE_MODE:=TOGGLE_MODE, TIMEOUT:=TIMEOUT);
    D1(Set:=SET, in:=IN1, RST:=RST, TOGGLE_MODE:=TOGGLE_MODE, TIMEOUT:=TIMEOUT);
    D2(Set:=SET, in:=IN2, RST:=RST, TOGGLE_MODE:=TOGGLE_MODE, TIMEOUT:=TIMEOUT);
    D3(Set:=SET, in:=IN3, RST:=RST, TOGGLE_MODE:=TOGGLE_MODE, TIMEOUT:=TIMEOUT);
    Q0 := D0.Q;
    Q1 := D1.Q;
    Q2 := D2.Q;
    Q3 := D3.Q;


    (* revision history
    hm	2. jan 2008		rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
