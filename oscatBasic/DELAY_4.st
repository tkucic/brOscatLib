FUNCTION_BLOCK DELAY_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=275*)
    out4 := out3;
    out3 := out2;
    out2 := out1;
    out1 := temp;
    temp := in;

    (* revision history

    hm 19.1.2007	rev 1.1
    	added variable temp to add 1 delay  for q1

    *)
END_FUNCTION_BLOCK
