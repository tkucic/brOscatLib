FUNCTION_BLOCK SRAMP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=470*)
    (* read the system_time in microseconds *)
    cycle_time();

    (* assure range of inputs *)
    A_up := MAX(0.0, A_UP);
    A_dn := MIN(0.0, A_dn);
    VU_max := MAX(0.0, VU_max);
    VD_max := MIN(0.0, VD_MAX);

    (* calculate the output offset *)
    IF rst OR NOT init THEN
    	init := TRUE;
    	Y := 0.0;
    	V := 0.0;
    ELSIF X = Y THEN
    	v := 0.0;
    ELSIF X > Y THEN
    	(* output is too low >> ramp up and brake at the end *)
    	(* accelerate the speed and limit to vu_max *)
    	v := MIN(v + A_UP * cycle_time.TC, vu_max);
    	(* calculate the max speed to be able to brake and select the lowest *)
    	v := MIN(SQRT((Y-X) * 2.0 * A_DN), v);
    	(* calculate the output and obey limits *)
    	y := LIMIT(limit_low, y + MIN(v * cycle_time.TC, X-Y), limit_high);
    ELSIF X < Y THEN
    	(* output is too high >> ramp dn and brake at the end *)
    	(* accelerate the speed and limit to vd_max *)
    	v := MAX(v + A_DN * cycle_time.TC, vd_max);
    	(* calculate the max speed to be able to brake and select the lowest *)
    	v := MAX(-SQRT((Y-X) * 2.0 * A_UP), v);
    	(* calculate the output and obey limits *)
    	y := LIMIT(limit_low, y + MAX(v * cycle_time.TC, X-Y), limit_high);
    END_IF


    (* revision history
    hm	13. mar. 2008	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	real constants updated to new systax using dot																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											

    *)



END_FUNCTION_BLOCK
