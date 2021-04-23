FUNCTION_BLOCK DELAY_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=275*)
    OUT4 := OUT3;
    OUT3 := OUT2;
    OUT2 := OUT1;
    OUT1 := temp;
    temp := IN;

    (* revision history

    hm 19.1.2007	rev 1.1
    	added variable temp to add 1 delay  for q1

    *)
END_FUNCTION_BLOCK
