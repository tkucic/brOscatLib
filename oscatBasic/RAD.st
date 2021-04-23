FUNCTION RAD
<<<<<<< HEAD:oscatBasic/RAD.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=61*)
    RAD := MODR(0.0174532925199433 * DEG, math.PI2);
=======
    RAD := MODR(0.0174532925199433 * DEG, PI2);
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/RAD.st

    (* revision history
    hm	4. aug 2006		rev 1.0
    	original version

    hm 	16. oct 2007	rev 1.1
    	added modr statement which prohibits RAD to become bigger than 2PI

    hm	18. oct 2008	rev 1.2
    	using math constants

    *)
END_FUNCTION
