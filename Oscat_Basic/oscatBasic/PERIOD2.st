FUNCTION PERIOD2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=131*)
    PERIOD2 := 	(DX >= DP[0,0] AND DX <= DP[0,1]) OR
    			(DX >= DP[1,0] AND DX <= DP[1,1]) OR
    			(DX >= DP[2,0] AND DX <= DP[2,1]) OR
    			(DX >= DP[3,0] AND DX <= DP[3,1]);


    (* revision history

    hm		27. apr 2008	rev 1.0
    	original version


    *) 
END_FUNCTION
