FUNCTION COUNT_SUBSTRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=150*)
    COUNT_SUBSTRING := 0;
    size := LEN(SEARCH);
    REPEAT
       pos := FIND(STR,SEARCH);
       IF pos > 0 THEN
          STR := REPLACE(STR, '', size,pos);
          COUNT_SUBSTRING := COUNT_SUBSTRING + 1;
       END_IF;
    UNTIL pos = 0
    END_REPEAT;


    (* revision history
    ks	20. jan. 2011	rev 1.0
    	original version

    *)


END_FUNCTION
