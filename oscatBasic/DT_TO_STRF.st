FUNCTION DT_TO_STRF
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=152*)
    IF LANG < 1 THEN ly := cLANGUAGE_DEFAULT; ELSE ly := MIN(cLANGUAGE_LMAX, LANG); END_IF

    (* decode date and time information *)
    dx := DT_TO_DATE(DTI);
    td := DT_TO_TOD(DTI);

    (* parse the format string *)
    RETVAL := FMT;
    pos := FIND(RETVAL, '#');
    WHILE pos > 0 DO
    	(* retrieve format identifier *)
    	f := BYTE_TO_INT(CODE(RETVAL, pos + 1));
    	(* generate the return string according to the format character *)
    	fs := '';
    	CASE f OF
    		65 : (* letter A retunrs the year in 4 digits *)
    			fs := INT_TO_STRING(YEAR_OF_DATE(dx));
    		66 : (* letter B returns the year in exactly 2 digits *)
                fs := INT_TO_STRING(YEAR_OF_DATE(dx));
    			fs := RIGHT(fs,2);
    		67 : (* letter C returns the month with 1 or 2 digits *)
    			fs := INT_TO_STRING(MONTH_OF_DATE(dx));
    		68 : (* letter D returns the month with exactly 2 digits *)
    			fs := INT_TO_STRING(MONTH_OF_DATE(dx));
    			IF LEN(fs) < 2 THEN fs := CONCAT('0', fs); END_IF
    		69 : (* letter E returns the month with 3 characters *)
    			MONTH_TO_STRING(MONTH_OF_DATE(dx), ly, 3, fs);
    		70 : (* letter f returns the month with all characters *)
    			MONTH_TO_STRING(MONTH_OF_DATE(dx), ly, 0, fs);
    		71 : (* letter G returns the day with up to 2 digits *)
    			fs := INT_TO_STRING(DAY_OF_MONTH(dx));
    		72 : (* letter H returns the day of the month with exactly 2 digits *)
    			fs := INT_TO_STRING(DAY_OF_MONTH(dx));
    			IF LEN(fs) < 2 THEN fs := CONCAT(FILL, fs); END_IF
    		73 : (* letter I returns the weekday as the number 1..7 1 = monday *)
    			fs := INT_TO_STRING(DAY_OF_WEEK(dx));
    		74 : (* letter J returns the weekday in 2 character writing *)
    			WEEKDAY_TO_STRING(DAY_OF_WEEK(dx), ly, 2, fs);
    		75 : (* letter K returns the weekday with all characters *)
    			WEEKDAY_TO_STRING(DAY_OF_WEEK(dx), ly, 0, fs);
    		76 : (* letter L returns AM or PM for the given DateTime *)
    			IF td >= TOD#12:00 THEN fs := 'PM'; ELSE fs := 'AM'; END_IF
    		77 : (* letter M returns the hour in 1 or 2 digit form 0..24h *)
    			fs := INT_TO_STRING(HOUR(td));
    		78 : (* letter N returns the hour in exactly 2 digit form 0..24h *)
    			fs := INT_TO_STRING(HOUR(td));
    			IF LEN(fs) < 2 THEN fs := CONCAT(FILL, fs); END_IF
    		79 : (* letter O returns the hour in 1 or 2 digit form 0..12h *)
    			tmp := HOUR(td) MOD 12;
    			IF tmp = 0 THEN tmp := 12; END_IF
    			fs := INT_TO_STRING(tmp);
    		80 : (* letter P returns the hour in exactly 2 digit form 0..12h *)
    			tmp := HOUR(td) MOD 12;
    			IF tmp = 0 THEN tmp := 12; END_IF
    			fs := INT_TO_STRING(tmp);
    			IF LEN(fs) < 2 THEN fs := CONCAT(FILL, fs); END_IF
    		81 : (* letter Q returns the minute of the hour in 1 or two digit form *)
    			fs := INT_TO_STRING(MINUTE(td));
    		82 : (* letter R returns the minute of the hour in exactly two digit form *)
    			fs := INT_TO_STRING(MINUTE(td));
    			IF LEN(fs) < 2 THEN fs := CONCAT(FILL, fs); END_IF
    		83 : (* letter S returns the second of the minute in 1 or two digit form *)
    			fs := INT_TO_STRING(REAL_TO_INT(SECOND(td)));
    		84 : (* letter T returns the second of the minute in exactly two digit form *)
    			fs := INT_TO_STRING(REAL_TO_INT(SECOND(td)));
    			IF LEN(fs) < 2 THEN fs := CONCAT(FILL, fs); END_IF
    		85 : (* letter U returns the milliseconds in 1 to 3 digits *)
    			fs := INT_TO_STRING(MS);
    		86 : (* letter V returns the milliseconds in exactly 3 digit form *)
    			fs := INT_TO_STRING(MS);
    			fs := CONCAT('00',fs);
    			fs := RIGHT(fs, 3);
    		87 : (* letter W returns the day of the month with exactly 2 digits first digit is filled with BLANK if necessary *)
    			fs := INT_TO_STRING(DAY_OF_MONTH(dx));
    			IF LEN(fs) < 2 THEN fs := CONCAT(BLANK, fs); END_IF
    		88 : (* letter X returns the month with exactly 2 digits first digit is filled with BLANK if necessary *)
    			fs := INT_TO_STRING(MONTH_OF_DATE(dx));
    			IF LEN(fs) < 2 THEN fs := CONCAT(BLANK, fs); END_IF
    		END_CASE
    	RETVAL := REPLACE(RETVAL, fs, 2, pos);
    	pos := FIND(RETVAL, '#');
    END_WHILE
    DT_TO_STRF := TRUE;

    (* revision history
    hm	7. oct. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changed language setup constants
    *)

END_FUNCTION
