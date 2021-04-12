FUNCTION_BLOCK FT_MIN_MAX
    IF rst OR NOT init THEN
    	mn := in;
    	mx := in;
    	init := TRUE;
    ELSIF in < mn THEN mn := in;
    ELSIF in > mx THEN mx := in;
    END_IF
END_FUNCTION_BLOCK
