FUNCTION IS_URLCHR
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=79*)
    IS_URLCHR := ((IN > 47) AND (IN < 58)) OR ((IN > 64) AND (IN < 91)) OR ((IN > 96) AND (IN < 123)) OR (IN = 126) OR (IN = 95) OR (IN =45) OR (IN =46);


    (* revision history
    hm		27. apr. 2008	rev 1.0
    	original version

    *)
END_FUNCTION
