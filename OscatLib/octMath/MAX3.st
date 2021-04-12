FUNCTION MAX3
    IF in1 >= in2 AND in1 >= in3 THEN
    	max3 := in1;
    ELSIF in2 >= in1 AND in2 >= in3 THEN
    	max3 := in2;
    ELSE
    	max3 := in3;
    END_IF
END_FUNCTION
