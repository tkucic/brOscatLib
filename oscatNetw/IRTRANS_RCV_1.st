FUNCTION_BLOCK IRTRANS_RCV_1
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=37*)
    Q := CMD AND DEV_CODE = DEV AND KEY_CODE = KEY;

    (* revision history
    hm	2. jan 2008		rev 1.0
    	original version

    hm	20. 6. 2008		rev 1.1
    	performance improvement

    hm	19. oct. 2008	rev 1.2
    	changed input device_code to DEV_CODE and device to DEV for compatibility reasons

    hm	06. dec. 2008	rev 1.3
    	IRTRANS_1 renamed to IRTRANS_RCV_1

    *)
END_FUNCTION_BLOCK
