FUNCTION_BLOCK FT_MIN_MAX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=99*)
    IF RST OR NOT INit THEN
    	MN := IN;
    	MX := IN;
    	INit := TRUE;
    ELSIF IN < MN THEN MN := IN;
    ELSIF IN > MX THEN MX := IN;
    END_IF
END_FUNCTION_BLOCK
