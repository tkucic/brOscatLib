FUNCTION MID3
    IF IN1 > IN2 THEN MID3 := IN1; IN1 := IN2; IN2 := MID3; END_IF
    IF IN2 > IN3 THEN IN2 := IN3; END_IF
    MID3 := SEL(IN1 > IN2, IN2, IN1);


    (*
    hm	1.1.2007	rev 1.1
    	rewrote the function for better performance

    hm	18. mar. 2011	rev 1.2
    	improve performance
    *)
END_FUNCTION
