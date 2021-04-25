FUNCTION_BLOCK RMP_B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=264*)
    (* generate ramp *)
    rmp(DIR := UP, E := E, TR := PT, RMP := OUT);

    (* SET or reset operation *)
    IF RST THEN
    	OUT := 0;
    ELSIF SET THEN
    	OUT := 255;
    END_IF

    (* checks for outputs stable and reset or SET BUSY flag *)
    LOW := OUT = 0;
    HIGH := OUT = 255;
    BUSY := NOT (LOW OR HIGH) AND E;


    (* revision history

    hm 5.10.2006	rev 1.1
    	added BUSY output
    hm 17.1.2007	rev 1.2
    	renamed input ud to UP for better usability
    	deleted unused variable step

    hm	17.9.2007		rev 1.3
    	replaced time() with t_plc_ms() for compatibility reasons

    hm	28. sep 2007	rev 1.4
    	added outputs on and off
    	BUSY is now disabled while en is false
    	new coding for higher accuracy and performance

    hm	5. oct 2007	rev 1.5
    	added statements to allow for PT to be t#0s output jumps to max or min immediately

    hm	25. dec 2007	rev 1.6
    	improved code for better performance

    hm	16. oct. 2008	rev 1.7
    	improved code for better performance

    hm	18. oct. 2008	rev 1.8
    	added type conversion to avoid warnings
    	changed input en to E for compatibility reasons

    hm	23. oct. 2008	REV 	2.0
    	new code using _RMP_B

    *)
END_FUNCTION_BLOCK
