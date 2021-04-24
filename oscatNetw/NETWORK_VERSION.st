FUNCTION NETWORK_VERSION
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=35*)
    IF IN THEN
    	NETWORK_VERSION := DATE_TO_DWORD(D#2016-07-01);
    ELSE
    	NETWORK_VERSION := 135;
    END_IF

    (* revision history
    ks	2. feb 2011	rev 1.0
    	original version

    *)
END_FUNCTION
