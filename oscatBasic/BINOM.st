FUNCTION BINOM
<<<<<<< HEAD:oscatBasic/BINOM.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=42*)
    IF 2 * K > n THEN
    	k := n - k;
=======
    IF 2 * K > N THEN
    	K := N - K;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/BINOM.st
    END_IF
    IF K > N THEN
    	RETURN;
    ELSIF K = 0 OR K = N THEN
    	BINOM := 1;
    ELSIF K = 1 THEN
    	BINOM := N;
    ELSE
    	BINOM := N;
    	N := N + 1;
    	FOR i := 2 TO K DO
    		BINOM := BINOM * (N - i) / i;
    	END_FOR
    END_IF



    (*
    BINOMialkoeffizient(n, k)
    1  wenn k = 0 return 1
    2  wenn 2k > n
    3      dann führe aus ergebnis \leftarrow BINOMialkoeffizient(n, n-k)
    4  sonst führe aus ergebnis \leftarrow n
    5          von i \leftarrow 2 bis k
    6              führe aus ergebnis \leftarrow ergebnis \cdot (n + 1 - i)
    7                        ergebnis \leftarrow ergebnis : i
    8  return ergebnis
    *)



    (* revision history
    hm	25. oct. 2008	rev 1.0
    	original version


    *)
END_FUNCTION
