FUNCTION REPLACE_UML
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=178*)
    pt ACCESS ADR(STR);
    pto ACCESS ADR(RETVAL);
    ptm ACCESS (ADR(pto) + INT_TO_UDINT(STRING_LENGTH));
    pt1 ACCESS ADR(su);
    pt2 ACCESS (ADR(pt1) + 1);
    L := LEN(STR);
    WHILE pos < L AND pos < STRING_LENGTH DO
    	IF pt < 127 THEN
    		(* no uml character simlply copy the character*)
    		pto := pt;
    	ELSE
    		(* convert the uml character *)
    		TO_UML(pt, su);
    		(* we must make sure pointer are not out of range *)
    		pto := pt1;
    		IF ADR(pto) < ADR(ptm) AND pt2 > 0 THEN
    			pto ACCESS (ADR(pto) + 1);
    			pto := pt2;
    		END_IF
    	END_IF
    	(* increment pointers *)
    	pt ACCESS (ADR(pt) + 1);
    	pto ACCESS (ADR(pto) + 1);
    	pos := pos + 1;
    END_WHILE

    (* properly close the output string *)
    pto := 0;
    REPLACE_UML := TRUE;

    (* revision history
    hm	29. feb 2008	rev 1.0
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGHT)
    	new code to avoid pointer out of range
    	use new function to_uml
    *)
END_FUNCTION
