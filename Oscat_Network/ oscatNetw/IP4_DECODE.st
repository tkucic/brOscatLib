FUNCTION IP4_DECODE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=77*)
    pos := FIND(str, '.');
    WHILE pos > 0 DO
    	IP4_DECODE := SHL(IP4_DECODE,8) OR STRING_TO_DWORD(LEFT(str,pos - 1));
    	str := DELETE(str, pos, 1);
    	pos := FIND(str, '.');
    END_WHILE
    IP4_DECODE := SHL(IP4_DECODE,8) OR STRING_TO_DWORD(str);


    (* revision history
    hm		29. feb 2008	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	new algorythm
    *)
END_FUNCTION
