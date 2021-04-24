FUNCTION_BLOCK BLIND_SECURITY
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=89*)
    IF FIRE THEN
    	QU := TRUE;
    	QD := FALSE;
    	STATUS := 111;
    ELSIF WIND THEN
    	QU := WIND_UP;
    	QD := NOT WIND_UP;
    	STATUS := 112;
    ELSIF ALARM THEN
    	QU := ALARM_UP;
    	QD := NOT ALARM_UP;
    	STATUS := 113;
    ELSIF DOOR THEN
    	QU := TRUE;
    	QD := FALSE;
    	STATUS := 114;
    ELSIF RAIN AND NOT (UP XOR DN) THEN
    	QU := RAIN_UP;
    	QD := NOT RAIN_UP;
    	STATUS := 115;
    ELSE
    	QU := UP;
    	QD := DN;
    	STATUS := S_IN;
    	PO := PI;
    	AO := AI;
    END_IF


    (* revision history
    hm	29. sep 2007	rev 1.0
    	original release

    hm	6. oct 2007		rev 1.1
    	added pos and angle inputs and outputs
    	manual will override RAIN position
    	ALARM position can now be configured

    hm		12. feb. 2008	rev 1.2
    	added config variables RAIN_UP and WIND_UP
    	position for RAIN and WIND is now configurable
    *)


END_FUNCTION_BLOCK
