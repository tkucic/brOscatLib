FUNCTION_BLOCK IRTRANS_RCV_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=37*)
    Q := cmd AND dev_code = dev AND key_code = key;

    (* revision history
    hm	2. jan 2008		rev 1.0
    	original version

    hm	20. 6. 2008		rev 1.1
    	performance improvement

    hm	19. oct. 2008	rev 1.2
    	changed input device_code to dev_code and device to dev for compatibility reasons

    hm	06. dec. 2008	rev 1.3
    	IRTRANS_1 renamed to IRTRANS_RCV_1

    *)
END_FUNCTION_BLOCK
