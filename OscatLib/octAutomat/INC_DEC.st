FUNCTION_BLOCK INC_DEC
    axb := cha XOR chb;

    (* create pulses for channel a *)
    clka := cha XOR edgea;
    edgea := cha;

    clkb := chb XOR edgeb;
    edgeb := chb;

    (* create pulses for both channels *)
    clk := clka OR clkb;

    (* set the direction output *)
    IF axb AND clka THEN dir := TRUE; END_IF
    IF axb AND clkb THEN dir := FALSE; END_IF

    (* increment or decrement the counter *)
    IF clk AND dir THEN cnt := cnt + 1; END_IF
    IF clk AND NOT dir THEN cnt := cnt -1; END_IF

    (* reset the counter if rst active *)
    IF rst THEN cnt := 0; END_IF

END_FUNCTION_BLOCK
