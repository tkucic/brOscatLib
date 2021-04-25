FUNCTION_BLOCK DRIVER_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=454*)
    d0(SET:=SET, IN:=IN0, RST:=RST, TOGGLE_MODE:=TOGGLE_MODE, TIMEOUT:=TIMEOUT);
    d1(SET:=SET, IN:=IN1, RST:=RST, TOGGLE_MODE:=TOGGLE_MODE, TIMEOUT:=TIMEOUT);
    d2(SET:=SET, IN:=IN2, RST:=RST, TOGGLE_MODE:=TOGGLE_MODE, TIMEOUT:=TIMEOUT);
    d3(SET:=SET, IN:=IN3, RST:=RST, TOGGLE_MODE:=TOGGLE_MODE, TIMEOUT:=TIMEOUT);
    Q0 := d0.Q;
    Q1 := d1.Q;
    Q2 := d2.Q;
    Q3 := d3.Q;


    (* revision history
    hm	2. jan 2008		rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
