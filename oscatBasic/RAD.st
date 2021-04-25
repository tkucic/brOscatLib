FUNCTION RAD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=61*)
    RAD := MODR(0.0174532925199433 * DEG, cPI2);

    (* revision history
    hm	4. aug 2006		rev 1.0
    	original version

    hm 	16. oct 2007	rev 1.1
    	added modr statement which prohibits RAD to become bigger than 2PI

    hm	18. oct 2008	rev 1.2
    	using math constants

    *)
END_FUNCTION
