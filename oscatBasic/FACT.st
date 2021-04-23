FUNCTION FACT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=49*)
    IF X >= 0 AND X <= 12 THEN
    	FACT := cFacts[X];
    ELSE
    	FACT := -1;
    END_IF


    (* working code without array
    IF X > 12 OR X < 0 THEN
    	FACT := -1;
    ELSIF X < 7 THEN
    	FACT := 1;
    	FOR i := 2 TO X DO
    		FACT := FACT * i;
    	END_FOR
    ELSE
    	FACT := 5040;
    	FOR i := 8 TO X DO
    		FACT := FACT * i;
    	END_FOR
    END_IF
    *)

    (* revision history
    hm 4.3.2007		rev 1.1
    	changed a critical error where while loop was indefinite.

    hm	10.12.2007	rev 1.2
    	start value for i has changed to 2 for better performance

    hm	10. mar 2008	rev 1.3
    	changed output of FACT to dint to allow bigger values

    hm	27. oct. 2008	rev 1.4
    	optimized code

    hm	26. mar. 2011	rev 1.5
<<<<<<< HEAD:oscatBasic/FACT.st
    	using array math.FACTs
=======
    	using array facts
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/FACT.st
    *)
END_FUNCTION
