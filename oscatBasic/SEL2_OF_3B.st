FUNCTION_BLOCK SEL2_OF_3B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=299*)
    Q := (IN1 AND IN2) OR (IN1 AND IN3) OR (IN2 AND IN3);
    TDEL(IN := (in1 XOR in2) OR (in1 XOR in3) OR (in2 XOR in3), PT := TD);
    W := TDEL.Q;


    (* revision history
    hm		19. may 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
