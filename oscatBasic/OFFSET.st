FUNCTION OFFSET
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=282*)
    IF D THEN OFFSET := DEFAULT; ELSE OFFSET := X; END_IF
    IF O1 THEN OFFSET := OFFSET + OFFSET_1; END_IF
    IF O2 THEN OFFSET := OFFSET + OFFSET_2; END_IF
    IF O3 THEN OFFSET := OFFSET + OFFSET_3; END_IF
    IF O4 THEN OFFSET := OFFSET + OFFSET_4; END_IF



    (* revision history
    hm	12. jan 2007
    	original version


    *)
END_FUNCTION
