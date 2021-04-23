FUNCTION_BLOCK TONOF
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=206*)
    IF IN XOR old THEN
      X(IN := FALSE, PT := SEL(IN,T_OFF,T_ON));
      mode := IN;
      old := IN;
    END_IF
    X(IN := TRUE);
    IF X.Q THEN Q := mode;END_IF

    (* revision history
    hm	10. dec 2007	rev 1.0
    	origINal version

    hm	17. sep. 2007	rev 1.1
    	improved performance

    hm	21. jul. 2009	rev 1.2
    	fixed a timINg probelm


    *)

END_FUNCTION_BLOCK