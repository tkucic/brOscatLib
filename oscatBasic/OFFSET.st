FUNCTION OFFSET
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=282*)
    IF D THEN OFFSET := default; ELSE OFFSET := X; END_IF;
    IF O1 THEN OFFSET := OFFSET + offset_1; END_IF;
    IF O2 THEN OFFSET := OFFSET + offset_2; END_IF;
    IF O3 THEN OFFSET := OFFSET + offset_3; END_IF;
    IF O4 THEN OFFSET := OFFSET + offset_4; END_IF;



    (* revision history
    hm	12. jan 2007
    	original version


    *)
END_FUNCTION
