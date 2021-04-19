TYPE
    REAL2 :    STRUCT
        R1 : REAL; (* small value *)
        RX : REAL; (* big value *)
    END_STRUCT;
    CONSTANTS_LANGUAGE :    STRUCT
        DEFAULT : INT := 1; (* 1=english, 2=german 3=french *)
        LMAX : INT := 3; (**)
        WEEKDAYS : ARRAY[1..3, 1..7] OF STRING[10] := ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche']; (**)
        WEEKDAYS2 : ARRAY[1..3, 1..7] OF STRING[2] := ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So', 'Lu', 'Ma', 'Me', 'Je', 'Ve', 'Sa', 'Di']; (**)
        MONTHS : ARRAY[1..3, 1..12] OF STRING[10] := ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December', 'Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember', 'Janvier', 'Février', 'mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Decembre']; (**)
        MONTHS3 : ARRAY[1..3, 1..12] OF STRING[3] := ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mrz', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez', 'Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Jun', 'Jul', 'Aou', 'Sep', 'Oct', 'Nov', 'Dec']; (**)
        DIRS : ARRAY[1..3, 0..15] OF STRING[3] := ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW', 'N', 'NNO', 'NO', 'ONO', 'O', 'OSO', 'SO', 'SSO', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW', 'N', 'NNO', 'NO', 'ONO', 'O', 'OSO', 'SO', 'SSO', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']; (**)
    END_STRUCT;
    CONSTANTS_LOCATION :    STRUCT
        DEFAULT : INT := 1; (* 1=germany, 2=austria 3=france 4=belgium-german 5= italien-Südtirol *)
        LMAX : INT := 5; (**)
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
        FACTS : ARRAY[0..12] OF DINT := [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600]; (**)
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
        CHARNAMES : ARRAY[1..4] OF STRING[253] := ['1']; (**)
        MTH_OFS : ARRAY[1..12] OF INT := [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]; (**)
        DECADES : ARRAY[0..8] OF REAL := [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000]; (**)
    END_STRUCT;
    TIMER_EVENT :    STRUCT
        TYP : BYTE; (**)
        CHANNEL : BYTE; (**)
        DAY : BYTE; (**)
        START : TOD; (**)
        DURATION : TIME; (**)
        LAND : BYTE; (**)
        LOR : BYTE; (**)
        LAST : DT; (**)
    END_STRUCT;
END_TYPE