FUNCTION ELEMENT_GET
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=34*)
    (* load pointers *)
    pt := ADR(ELEMENT);
    po := ADR(ELEMENT_GET);

    (* search for the n-th occurence of a separation character and store position in i *)
    WHILE (cnt < POS) AND (i < ELEMENT_LENGTH) AND (pt^[i] > 0) DO
    	IF pt^[i] = SEP THEN cnt := cnt + 1; END_IF
    	i := i + 1;
    END_WHILE

    (* copy the list ELEMENT to output *)
    IF i < ELEMENT_LENGTH THEN c := pt^[i]; END_IF
    WHILE (c <> SEP) AND (c > 0) AND (o < ELEMENT_LENGTH) AND (i < ELEMENT_LENGTH) DO
    	po^[o] :=pt^[i];
    	o := o + 1;
    	i := i + 1;
    	c := pt^[i];
    END_WHILE

    (* terminate the output string *)
    po^[o] := 0;

    (* revision histroy
    ks 05. apr. 2011	rev 1.0
    	original release

    *)
END_FUNCTION
