FUNCTION_BLOCK FT_MIN_MAX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=99*)
    IF rst OR NOT init THEN
    	mn := in;
    	mx := in;
    	init := TRUE;
    ELSIF in < mn THEN mn := in;
    ELSIF in > mx THEN mx := in;
    END_IF;
END_FUNCTION_BLOCK
