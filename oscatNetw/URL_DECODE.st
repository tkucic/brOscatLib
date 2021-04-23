FUNCTION URL_DECODE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=87*)
    URL_DECODE := IN;
    pos := FIND(URL_DECODE,'%');
    WHILE pos > 0 DO
    	seq := MID(URL_DECODE,2,pos + 1);
    	new := OSCAT_BASIC.CHR_TO_STRING(DWORD_TO_BYTE(OSCAT_BASIC.HEX_TO_DWORD(seq)));
    	URL_DECODE := REPLACE(URL_DECODE, new, 3, pos);
    	pos := FIND(URL_DECODE,'%');
    END_WHILE


    (* revision history
    hm	27. apr. 2008	rev 1.0
    	origINal version

    hm	17. dec. 2008	rev 1.1
    	changes name of function chr to chr_to_strINg

    ks	10. mai. 2008	rev 1.2
    	strINglength 250
    *)
END_FUNCTION
