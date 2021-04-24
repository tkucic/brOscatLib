FUNCTION_BLOCK RMP_SOFT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=266*)
    tmp := SEL(IN, 0, VAL);
    IF tmp > OUT THEN
    	(* we need to ramp down *)
    	rmp(dir := TRUE, E := TRUE, TR := PT_ON, rmp := OUT);
    	(* make sure OUT does not surpass tmp *)
    	OUT := MIN(OUT, tmp);
    ELSIF tmp < OUT THEN
    	(* we need to ramp up *)
    	rmp(dir := FALSE, E := TRUE, TR := PT_OFF, rmp := OUT);
    	(* make sure OUT does not surpass tmp *)
    	OUT := MAX(OUT, tmp);
    ELSE
    	(* no ramp necessary *)
    	rmp(E := FALSE, rmp := OUT);
    END_IF


    (* revision history

    hm 22.1.2007	rev 1.1
    	deleted unused variables X1 and I, X2 and X3

    hm	17.9.2007	rev 1.2
    	replaced time() with t_plc_ms() for compatibility reasons

    hm	26. oct. 2008	2.0
    	new code using _rmp_b
    *)

END_FUNCTION_BLOCK
