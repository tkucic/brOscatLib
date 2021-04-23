FUNCTION IP4_DECODE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=77*)
    pos := FIND(STR, '.');
    WHILE pos > 0 DO
    	IP4_DECODE := SHL(IP4_DECODE,8) OR STRING_TO_DWORD(LEFT(STR,pos - 1));
    	STR := DELETE(STR, pos, 1);
    	pos := FIND(STR, '.');
    END_WHILE
    IP4_DECODE := SHL(IP4_DECODE,8) OR STRING_TO_DWORD(STR);


    (* revision history
    hm		29. feb 2008	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	new algorythm
    *)
END_FUNCTION
