FUNCTION FSTRING_TO_DT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=161*)
    (* scan input string *)
    WHILE FMT <> '' DO
    	c := LEFT(FMT,1);
    	IF c = ignore THEN
    		(* skip ignore characters *)
    		FMT := DELETE(FMT,1,1);
    		SDT := DELETE(SDT,1,1);
    	ELSIF c = fchar THEN
    		(* format chracter found skip format char and read identifier *)
    		(* store format identifier in c and skip to next char in FMT *)
    		c := MID(FMT,1,2);
    		FMT := DELETE(FMT,2,1);
    		(* extract the substring until the end of SDT or to next char of FMT *)
    		IF FMT = '' THEN
    			tmp := SDT;
    		ELSE
    			(* serach for end of substring *)
    			end := FIND(SDT, LEFT(FMT,1))-1;
    			tmp := LEFT(SDT, end);
    			SDT := DELETE(SDT, end,1);
    		END_IF
    		(* extract information from substring *)
    		IF c = 'Y' THEN
    			dy := STRING_TO_INT(tmp);
    			IF dy < 100 THEN dy := dy + 2000; END_IF
    		ELSIF c = 'M' THEN
    			dm := STRING_TO_INT(tmp);
    		ELSIF c = 'N' THEN
    			dm := FSTRING_TO_MONTH(tmp,0);
    		ELSIF c = 'D' THEN
    			dd := STRING_TO_INT(tmp);
    		ELSIF c = 'h' THEN
    			th := STRING_TO_INT(tmp);
    		ELSIF c = 'm' THEN
    			tm := STRING_TO_INT(tmp);
    		ELSIF c = 's' THEN
    			ts := STRING_TO_INT(tmp);
    		END_IF
    	ELSIF c = LEFT(SDT,1) THEN
    		(* skip matching characters *)
    		FMT := DELETE(FMT,1,1);
    		SDT := DELETE(SDT,1,1);
    	ELSE
    		RETURN;
    	END_IF
    END_WHILE

    FSTRING_TO_DT := SET_DT(dy,dm,dd,th,tm,ts);


    (* revision histroy
    hm	24. sep. 2008	rev 1.0
    	original release


    *)	

END_FUNCTION
