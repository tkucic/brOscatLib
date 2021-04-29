TYPE
    REAL2 :    STRUCT
        R1 : REAL; (* small value *)
        RX : REAL; (* big value *)
    END_STRUCT;
    CONSTANTS_LANGUAGE :    STRUCT
        DEFAULT : INT := 1; (* 1=english, 2=german 3=french *)
        LMAX : INT := 3;
        WEEKDAYS : ARRAY[1..3, 1..7] OF STRING[10] := ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
        WEEKDAYS2 : ARRAY[1..3, 1..7] OF STRING[2] := ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So', 'Lu', 'Ma', 'Me', 'Je', 'Ve', 'Sa', 'Di'];
        MONTHS : ARRAY[1..3, 1..12] OF STRING[10] := ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December', 'Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember', 'Janvier', 'Février', 'mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Decembre'];
        MONTHS3 : ARRAY[1..3, 1..12] OF STRING[3] := ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mrz', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez', 'Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Jun', 'Jul', 'Aou', 'Sep', 'Oct', 'Nov', 'Dec'];
        DIRS : ARRAY[1..3, 0..15] OF STRING[3] := ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW', 'N', 'NNO', 'NO', 'ONO', 'O', 'OSO', 'SO', 'SSO', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW', 'N', 'NNO', 'NO', 'ONO', 'O', 'OSO', 'SO', 'SSO', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW'];
    END_STRUCT;
    CONSTANTS_LOCATION :    STRUCT
        DEFAULT : INT := 1; (* 1=germany, 2=austria 3=france 4=belgium-german 5= italien-Südtirol *)
        LMAX : INT := 5;
        LANGUAGE : ARRAY[1..5] OF INT := [2, 2, 3, 2, 2]; (* language spoken in the location *)
    END_STRUCT;
    CONSTANTS_MATH :    STRUCT
        PI : REAL := 3.1415926535897931; (* Kreiszahl PI *)
        PI2 : REAL := 6.2831853071795862; (* PI * 2 *)
        PI4 : REAL := 12.566370614359172; (* PI * 4 *)
        PI05 : REAL := 1.5707963267949; (* PI / 2 *)
        PI025 : REAL := 0.785398163397448; (* PI / 4 *)
        PI_INV : REAL := 0.318309886183791; (* 1 / PI *)
        E : REAL := 2.7182818284590451; (* Euler constant e *)
        E_INV : REAL := 0.367879441171442; (* 1 / e *)
        SQ2 : REAL := 1.4142135623731; (* Wurzel von 2 *)
        FACTS : ARRAY[0..12] OF DINT := [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600];
    END_STRUCT;
    CONSTANTS_PHYS :    STRUCT
        C : REAL := 299792458; (* Lichtgeschwindigkeit in m/s *)
        E : REAL := 1.60217653E-19; (* elementarladung in Colomb = A * s *)
        G : REAL := 9.80665; (* Erdbeschleunigung in m / s² *)
        T0 : REAL := -273.15; (* absoluter Nullpunkt in °C *)
        RU : REAL := 8.314472; (* Universelle Gaskonstante in J / (mol · K) *)
        PN : REAL := 101325; (* NormalDruck in Pa *)
    END_STRUCT;
    CONSTANTS_SETUP :    STRUCT
        EXTENDED_ASCII : BOOL := TRUE; (* setup Parameters *)
        CHARNAMES : ARRAY[1..4] OF STRING[253] := [';"&quot;&&amp;<&lt;>&gt;€&euro; &nbsp;¡&iexcl;¢&cent;£&pound;¤&curren;¥&yen;¦&brvbar;§&sect;¨&uml;©&copy;ª&ordf;«&laquo;¬&not;­&shy;®&reg;¯&macr;°&deg;±&plusmn;²&sup2;³&sup3;´&acute;µ&micro;¶&para;·&middot;¸&cedil;¹&sup1;º&ordm;»&raquo;¼&frac14;Û&Ucirc;',
		';¾&frac34;¿&iquest;À&Agrave;Á&Aacute;Â&Acirc;Ã&Atilde;Ä&Auml;Å&Aring;Æ&AElig;Ç&Ccedil;È&Egrave;É&Eacute;Ê&Ecirc;Ë&Euml;Ì&Igrave;Í&Iacute;Î&Icirc;Ï&Iuml;Ð&ETH;Ñ&Ntilde;Ò&Ograve;Ó&Oacute;Ô&Ocirc;Õ&Otilde;Ö&Ouml;×&times;Ø&Oslash;Ù&Ugrave;Ú&Uacute;½&frac12;',
		';Ü&Uuml;Ý&Yacute;Þ&THORN;ß&szlig;à&agrave;á&aacute;â&acirc;ã&atilde;ä&auml;å&aring;æ&aelig;ç&ccedil;è&egrave;é&eacute;ê&ecirc;ë&euml;ì&igrave;í&iacute;î&icirc;ï&iuml;ð&eth;ñ&ntilde;ò&ograve;ó&oacute;ô&ocirc;õ&otilde;ö&ouml;÷&divide;ø&oslash;ù&ugrave;',
		';ú&uacute;û&ucirc;ü&uuml;ý&yacute;þ&thorn;ÿ&yuml;'];
        MTH_OFS : ARRAY[1..12] OF INT := [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
        DECADES : ARRAY[0..8] OF REAL := [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000];
    END_STRUCT;
    TIMER_EVENT :    STRUCT
        TYP : BYTE;
        CHANNEL : BYTE;
        DAY : BYTE;
        START : TOD;
        DURATION : TIME;
        LAND : BYTE;
        LOR : BYTE;
        LAST : DT;
    END_STRUCT;
    FRACTION :    STRUCT
        NUMERATOR : INT;
        DENOMINATOR : INT;
    END_STRUCT;
    COMPLEX :    STRUCT
        re : REAL;
        im : REAL;
    END_STRUCT;
    VECTOR_3 :    STRUCT
        X : REAL;
        Y : REAL;
        Z : REAL;
    END_STRUCT;
    ESR_DATA :    STRUCT
        TYP : BYTE;
        ADRESS : STRING[10];
        DS : DT;
        TS : TIME;
        DATA : ARRAY[0..7] OF BYTE;
    END_STRUCT;
    CALENDAR :    STRUCT
        UTC : DT; (* world time UTC *)
        LOCAL_DT : DT; (* local time *)
        LOCAL_DATE : DATE; (* local date *)
        LOCAL_TOD : TOD; (* local time of day *)
        YEAR : INT; (* year of LDATE *)
        MONTH : INT; (* month of LDATE *)
        DAY : INT; (* day of LDATE *)
        WEEKDAY : INT; (* weekday of LDATE *)
        OFFSET : INT; (* Time Zone Offset for Local time in minutes *)
        DST_EN : BOOL; (* daylight savings time enable *)
        DST_ON : BOOL; (* true when daylight savings time os on *)
        NAME : STRING[5]; (* name of time zone *)
        LANGUAGE : INT; (* location number pls see location setup *)
        LONGITUDE : REAL; (* longitude of current location *)
        LATITUDE : REAL; (* latitude of current location *)
        SUN_RISE : TOD; (* sun_rise for current location *)
        SUN_SET : TOD; (* sun_set for current location *)
        SUN_MIDDAY : TOD; (* worldtime when sun stands at south position *)
        SUN_HEIGTH : REAL; (* suns heigth at midday, south position *)
        SUN_HOR : REAL; (* sun angle horizontal 0 = north in degrees *)
        SUN_VER : REAL; (* sun angle vertical above horizon in degrees *)
        NIGHT : BOOL; (* true between sun_set and sun_rise *)
        HOLIDAY : BOOL; (* true when holiday *)
        HOLY_NAME : STRING[30]; (* name of holiday *)
        WORK_WEEK : INT; (* current work week *)
    END_STRUCT;
    HOLIDAY_DATA :    STRUCT
        NAME : STRING[30];
        DAY : SINT;
        MONTH : SINT;
        USE : SINT;
    END_STRUCT;
    SDT :    STRUCT
        YEAR : INT;
        MONTH : INT;
        DAY : INT;
        WEEKDAY : INT;
        HOUR : INT;
        MINUTE : INT;
        SECOND : INT;
        MS : INT;
    END_STRUCT;
END_TYPE