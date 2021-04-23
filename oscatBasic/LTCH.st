FUNCTION_BLOCK LTCH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=242*)
    (* as long as L is true, the latch is transparent and and change of D is transferred to Q *)
    (* of course only when there is no asynchronous reset *)
    IF RST THEN				(* if asynchronous reset then Q=0 *)
    	Q := FALSE;
    ELSIF L THEN			(* latch is transparent *)
    	Q := D;
    END_IF


    (* revision history
    hm	4. aug 2006		rev 1.0
    	original version

    hm	27. dec 2007	rev 1.1
    	changed code for better performance

    hm	30. oct. 2008	rev 1.2
    	deleted unnecessary init with 0

    *)
END_FUNCTION_BLOCK
