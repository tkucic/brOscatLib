FUNCTION TIMER_EVENT_DECODE
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=62*)
    (* a timer EVENT is specified as follows:
    	$typ;ch;day;start;duration;land;lor#
    $ 		= start of definition
    typ 	= type of definition	(number)
    channel	= channel number		(number)
    day 	= day number			(number)
    start	= start time			(time of day)
    duration= duration of EVENT		(time)
    land	= mask for output AND	(8bit value)
    lor		= mask for ourput OR	(8bit value)
    #		= end of definition
    *)

    (* check for start and ending character *)
    IF (LEFT(EVENT,1) <> '<') AND (RIGHT(EVENT,1) <> '>') THEN RETURN; END_IF
    stop := LEN(EVENT);
    pt ACCESS ADR(EVENT);
    start := 2;

    (* parse the string for next ; *)
    FOR pos := 2 TO stop DO
    	IF pt[pos] = 59 OR pt[pos] = 62 THEN
    		tmp := MID(EVENT, pos - start, start);
    		CASE step OF
    			0:	(* read type *)
    				RETVAL.TYP := FSTRING_TO_BYTE(tmp);

    			1:	(* read channel *)
    				RETVAL.CHANNEL := FSTRING_TO_BYTE(tmp);

    			2:	(* read day *)
    				IF IS_CC(tmp,'0123456789abcdefABCDEF#') THEN
    					RETVAL.DAY := FSTRING_TO_BYTE(tmp);
    				ELSIF RETVAL.TYP = 2 THEN
    					RETVAL.DAY := FSTRING_TO_WEEK(tmp, LANG);
    				ELSE
    					RETVAL.DAY := INT_TO_BYTE(FSTRING_TO_WEEKDAY(tmp, LANG));
    				END_IF

    			3:	(* read start *)
    				RETVAL.START := STRING_TO_TOD(tmp);

    			4:	(* read duaration *)
    				RETVAL.DURATION := STRING_TO_TIME(tmp);

    			5:	(* read land *)
    				RETVAL.LAND := FSTRING_TO_BYTE(tmp);

    			6:	(* read lor *)
    				RETVAL.LOR := FSTRING_TO_BYTE(tmp);
    		END_CASE
    		start := pos + 1;
    		step := step + 1;
    	END_IF
    END_FOR
    TIMER_EVENT_DECODE := TRUE;



    (* revision history
    hm	17. jun 2008	rev 1.0
    	original version

    hm	25. oct. 2008	rev 1.1
    	adding input LANG for language selection
    *)

END_FUNCTION
