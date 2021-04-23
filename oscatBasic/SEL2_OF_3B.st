FUNCTION_BLOCK SEL2_OF_3B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=299*)
    Q := (IN1 AND IN2) OR (IN1 AND IN3) OR (IN2 AND IN3);
    TDEL(IN := (IN1 XOR IN2) OR (IN1 XOR IN3) OR (IN2 XOR IN3), PT := TD);
    W := TDEL.Q;


    (* revision history
    hm		19. may 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
