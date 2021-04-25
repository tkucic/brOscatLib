FUNCTION DEG_TO_DIR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=356*)
    IF L = 0 THEN ly := cLOCATION_DEFAULT; ELSE ly := MIN(L, cLOCATION_LMAX); END_IF
    RETVAL := cDIRS[ly, ((SHL(DEG,N-1) + 45) / 90) MOD SHL(INT#2,N)*SHR(INT#8,N)];
    DEG_TO_DIR := TRUE;


    (*
    DIR := ((SHL(DEG,N-1) + 45) / 90) MOD SHL(INT#2,N);
    explanation :
    DIR is calculated BY the following formula:
    DIR := ((DIR + 45) / 90) MOD 4 if N = 1 digit
    North = 0, East = 1 ....
    DIR := ((DIR + 22,5) / 45) MOD 8 if N = 2 digit
    convert to integer calculation
    DIR := ((DIR*2 + 45) / 90) MOD 8
    N = 0, NE = 1 ....
    ther above formula replaces 2N with shift for performance
    *)



    (* revision histroy
    hm	11. jun. 2008	rev 1.0
    	original release

    hm	22. oct. 2008	rev 1.1
    	changed size of string variables to 30
    *)
END_FUNCTION
