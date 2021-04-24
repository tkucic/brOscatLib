FUNCTION_BLOCK INC_DEC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=459*)
    axb := CHA XOR CHB;

    (* create pulses for channel a *)
    clka := CHA XOR edgea;
    edgea := CHA;

    clkb := CHB XOR edgeb;
    edgeb := CHB;

    (* create pulses for both channels *)
    clk := clka OR clkb;

    (* set the direction output *)
    IF axb AND clka THEN DIR := TRUE; END_IF
    IF axb AND clkb THEN DIR := FALSE; END_IF

    (* increment or decrement the counter *)
    IF clk AND DIR THEN CNT := CNT + 1; END_IF
    IF clk AND NOT DIR THEN CNT := CNT -1; END_IF

    (* reset the counter if RST active *)
    IF RST THEN CNT := 0; END_IF

END_FUNCTION_BLOCK
