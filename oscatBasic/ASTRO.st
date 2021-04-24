FUNCTION_BLOCK ASTRO
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=354*)
    YAE :=	AE
    		+ M * 6.6845871535E-012
    		+ PC * 206265.0
    		+ LJ * 63240.0;
    YM := YAE * 149.597870E9;
    YPC := YAE * 4.8481322570E-006;
    YLJ := YAE * 1.5812776724E-005;


    (*
    Länge Meter M SI-Basiseinheit
    Astronomische Einheit* AE 1 AE = 149,597 870 · E9 M
    Parsec PC 1 PC = 206265 AE = 30,857 · E15 M
    Lichtjahr LJ 1 LJ = 9,460 530 · E15 M = 63240 AE = 0,306 59 PC
    Ångström Å 1 Å = E–l0 M
    typograph. Punkt p 1 p = 0,376 065 mm • im Druckereigewerbe
    inch** in 1 in = 2,54 · E–2 M = 25,4 mm***
    foot ft 1 ft = 0,3048 M = 30,48 cm
    yard yd 1 yd = 0,9144 M
    mile mile 1 mile = 1609,344 M
    Internat. Seemeile sm 1 sm = 1852 M
    Fathom fm 1 fm = 1,829 M • in der Seeschifffahrt
    *)

    (* revision history

    hm	27. mar. 2007	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	improved code

    *)

END_FUNCTION_BLOCK
