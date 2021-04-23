FUNCTION OFFSET2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=285*)
    IF D THEN OFFSET2 := default; ELSE OFFSET2 := X; END_IF
    IF O4 THEN OFFSET2 := OFFSET2 + offset_4;
    ELSIF O3 THEN OFFSET2 := OFFSET2 + offset_3;
    ELSIF O2 THEN OFFSET2 := OFFSET2 + offset_2;
    ELSIF O1 THEN OFFSET2 := OFFSET2 + offset_1;
    END_IF
END_FUNCTION