FUNCTION_BLOCK IRTRANS_RCV_8
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=39*)
    decode := CMD AND DEV_CODE = DEV;

    Q0 := KEY = KEY_CODE_0 AND decode;
    Q1 := KEY = KEY_CODE_1 AND decode;
    Q2 := KEY = KEY_CODE_2 AND decode;
    Q3 := KEY = KEY_CODE_3 AND decode;
    Q4 := KEY = KEY_CODE_4 AND decode;
    Q5 := KEY = KEY_CODE_5 AND decode;
    Q6 := KEY = KEY_CODE_6 AND decode;
    Q7 := KEY = KEY_CODE_7 AND decode;


    (* revision history
    hm	2. jan 2008		rev 1.0
    	original version

    hm	17. oct 2008	rev 1.1
    	improved performance

    hm	19. oct. 2008	rev 1.2
    	changed input DEVice_code to DEV_CODE and DEVice to DEV for compatibility reasons

    hm	06. dec. 2008	rev 1.3
    	IRTRANS_1 renamed to IRTRANS_RCV_8

    *)
END_FUNCTION_BLOCK
