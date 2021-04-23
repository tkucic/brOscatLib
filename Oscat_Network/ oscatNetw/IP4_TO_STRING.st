FUNCTION IP4_TO_STRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=78*)
    (* mask bits AND INSERT AT given position *)
    tmp := BYTE_TO_STRING(DWORD_TO_BYTE(IP4));
    IP4_TO_STRING := CONCAT('...', tmp);
    tmp := BYTE_TO_STRING(DWORD_TO_BYTE(SHR(IP4,8)));
    IP4_TO_STRING := INSERT(IP4_TO_STRING, tmp, 2);
    tmp := BYTE_TO_STRING(DWORD_TO_BYTE(SHR(IP4,16)));
    IP4_TO_STRING := INSERT(IP4_TO_STRING, tmp, 1);
    tmp := BYTE_TO_STRING(DWORD_TO_BYTE(SHR(IP4,24)));
    IP4_TO_STRING := CONCAT(tmp, IP4_TO_STRING);



    (* revision history
    hm	22. apr 2008	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	improved code
    *)
END_FUNCTION
