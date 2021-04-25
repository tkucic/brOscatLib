FUNCTION _ARRAY_SHUFFLE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=74*)
    stop := UINT_TO_INT(SHR(size,2)-1);
    FOR i := 0 TO stop DO
            pos := RDM2(i+pos,0,stop);
            (* swap elements *)
            temp := pt^[i];
            pt^[i] := pt^[pos];
            pt^[pos] := temp;
    END_FOR;

    _ARRAY_SHUFFLE := TRUE;


    (* revision History
    hm 	4. mar 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	changed type of input size to uint

    hm	30. mar. 2008	rev 1.2
    	changed last in rdm2 fromm pos to i + pos to allow for more randomness

    *)
END_FUNCTION
