FUNCTION_BLOCK RMP_W
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=267*)
    (* generate ramp *)
    rmp(dir := UP, E := E, TR := PT, rmp := OUT);

    (* SET or reSET operation *)
    IF RST THEN
    	OUT := 0;
    ELSIF SET THEN
    	OUT := 65535;
    END_IF

    (* checks for OUTputs stable and reSET or SET BUSY flag *)
    LOW := OUT = 0;
    HIGH := OUT = 65535;
    BUSY := NOT (LOW OR HIGH) AND E;


    (* revision history:

    hm 4.10.2006		rev 1.1
    	added the BUSY OUTput which signals that the ramp is running.

    hm 22.1.2007		rev 1.2
    	deleted unused variable step

    hm	17.9.2007		rev 1.3
    	replaced time() with t_plc_ms() for compatibility reasons

    hm	28. sep 2007	rev 1.4
    	added OUTputs on and off
    	BUSY is now disabled while en is false
    	new coding for HIGHer accuracy and performance

    hm	5. oct 2007	rev 1.5
    	added statements to alLOW for PT to be t#0s OUTput jumps to max or min immediately

    hm	2. dec 2007	rev 1.6
    	corrected an error in calculation of step response

    hm	25. dec 2007	rev 1.7
    	corrected an error while step response was too sLOW for fast rise times

    hm	16. oct. 2008	rev 1.8
    	improved performance

    hm	18. oct. 2008	rev 1.9
    	renamed inOUT EN to E for compatibility reasons

    hm	23. oct. 2008	rev 2.0
    	new code using _RMP_W
    *)

END_FUNCTION_BLOCK