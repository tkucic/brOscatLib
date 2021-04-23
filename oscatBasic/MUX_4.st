FUNCTION MUX_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=229*)
    IF A1 THEN
    	MUX_4 := SEL(A0, D2, D3);
    ELSE
    	MUX_4 := SEL(A0, D0, D1);
    END_IF


    (*
    revision history:
    hm 	5.10.2006		rev 1.1
    	rewritten to ST for better portability

    hm	16. oct. 2008	rev 1.2
    	improved performance

    *)
END_FUNCTION
