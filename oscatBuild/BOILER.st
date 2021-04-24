FUNCTION_BLOCK BOILER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=428*)
    (* read sensors and check for valid data *)
    IF T_UPPER > T_PROTECT_HIGH THEN
    	STATUS := 1;
    	HEAT := FALSE;
    	ERROR := TRUE;
    ELSIF T_UPPER < T_PROTECT_LOW THEN
    	STATUS := 2;
    	HEAT :=	TRUE;
    	ERROR := TRUE;
    ELSIF T_LOWER > T_PROTECT_HIGH AND T_LOWER_ENABLE THEN
    	STATUS := 3;
    	HEAT := FALSE;
    	ERROR := TRUE;
    ELSIF T_LOWER < T_PROTECT_LOW AND T_LOWER_ENABLE THEN
    	STATUS := 4;
    	HEAT := TRUE;
    	ERROR := TRUE;
    ELSIF NOT PRESSURE THEN
    	STATUS := 5;
    	HEAT := FALSE;
    	ERROR := TRUE;
    ELSIF REQ_1 OR REQ_2 OR ENABLE OR BOOST THEN
    	ERROR := FALSE;

    	(* determine if HEAT needs to be turned on *)
    	IF BOOST AND NOT EDGE_ AND T_UPPER < T_UPPER_MAX THEN
    		STATUS := 101;
    		HEAT := TRUE;
    		boost_mode := TRUE;
    	ELSIF ENABLE AND T_UPPER < T_UPPER_MIN THEN
    		STATUS := 102;
    		HEAT := TRUE;
    	ELSIF REQ_1 AND T_UPPER < T_REQUEST_1 THEN
    		STATUS := 103;
    		HEAT := TRUE;
    	ELSIF REQ_2 AND T_UPPER < T_REQUEST_2 THEN
    		STATUS := 104;
    		HEAT := TRUE;
    	END_IF

    	(* determine the shut off temperature *)
    	IF HEAT THEN
    		IF (ENABLE OR boost_mode) THEN
    			flag_0 := TRUE;
    			IF T_LOWER_ENABLE AND T_LOWER > T_LOWER_MAX THEN
    				flag_0 := boost_mode := FALSE;
    			ELSIF NOT T_LOWER_ENABLE AND T_UPPER > T_UPPER_MAX THEN
    				flag_0 := boost_mode := FALSE;
    			END_IF
    		ELSE
    			flag_0 := FALSE;
    		END_IF
    		flag_1 := (REQ_1 AND T_UPPER > T_REQUEST_1 + T_REQUEST_HYS) AND REQ_1;
    		flag_2 := (REQ_2 AND T_UPPER > T_REQUEST_2 + T_REQUEST_HYS) AND REQ_2;

    		(* shut off HEAT if no longer needed *)
    		HEAT := flag_0 OR flag_1 OR flag_2;
    		IF HEAT = FALSE THEN STATUS := 100; END_IF
    	END_IF
    ELSE
    	STATUS := 100;
    	HEAT := FALSE;
    	ERROR := FALSE;
    END_IF
    EDGE_ := BOOST;


    (* revision history
    hm	27. feb. 2007	rev 1.0
    	original version

    hm	16. oct. 2008	rev 1.1
    	improved performance

    hm	13. mar. 2009	rev 1.2
    	real constants updated to new systax using dot
    	replaced double assignments
    *)
END_FUNCTION_BLOCK
