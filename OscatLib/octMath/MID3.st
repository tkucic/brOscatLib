FUNCTION MID3
    IF (in1 <= in2) AND (in1 >= in3) OR (in1 >= in2) AND (in1 <= in3) THEN
    	mid3 := in1;
    ELSIF (in2 <= in1) AND (in2 >= in3) OR (in2 >= in1) AND (in2 <= in3) THEN
    	mid3 := in2;
    ELSE
    	mid3 := in3;
    END_IF

    (*
    hm	1.1.2007	rev 1.1
    	rewrote the function for better performance

    *)
END_FUNCTION
